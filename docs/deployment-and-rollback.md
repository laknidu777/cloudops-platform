# CloudOps Platform — Deployment and Rollback

## 1. Deployment architecture

The application is deployed to an AWS EC2 instance using GitHub Actions and AWS Systems Manager (SSM).

**Deployment flow:**

1. A developer pushes changes to the `main` branch.
2. GitHub Actions validates the Node.js application and runs automated tests.
3. Docker builds the application image.
4. Trivy scans the image for vulnerabilities.
5. The image is published to GitHub Container Registry (GHCR).
6. GitHub Actions connects to EC2 through AWS SSM.
7. A candidate container starts on port `3001`.
8. The candidate must pass its Docker health check.
9. The existing production container is replaced with the new version.
10. The new production container must pass its health check.

## 2. Image versioning

Images are published with two tags:

- `latest` — identifies the most recently published image.
- Git commit SHA — identifies a specific immutable application version.

Production deployments use the commit SHA tag to ensure the deployed version can be identified.

## 3. Production configuration

- Platform: AWS EC2
- Deployment method: GitHub Actions + AWS SSM
- Container runtime: Docker
- Registry: GitHub Container Registry
- Production container: `cloudops-api`
- Production port: `127.0.0.1:3000`
- Health endpoint: `/health`

## 4. Rollback strategy

Before replacing production, the deployment script records the previous Docker image ID.

If the new production container fails to start or become healthy:

1. The failed container is removed.
2. The previous image is started again.
3. The previous container's health is checked.
4. If it becomes healthy, the rollback is reported as successful.
5. The deployment workflow still reports failure so the unsuccessful release is visible.

The candidate container is tested before production replacement to reduce deployment risk.

## 5. Manual production verification

Connect to EC2 through AWS Systems Manager Session Manager.

Check the production container:

```bash
sudo docker ps --filter name=cloudops-api
```

Check the application health endpoint:

```bash
sudo curl -i http://127.0.0.1:3000/health
```

Expected response:

```json
{
  "status": "healthy",
  "service": "cloudops-platform"
}
```

## 6. Rollback testing status

The updated rollback automation has passed CI validation and was deployed successfully.

The previous image was also tested separately and returned a healthy response.

**Note:** An actual production failure has not yet been deliberately triggered to exercise the automated rollback path. This remains a future controlled test.
