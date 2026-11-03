# CloudOps Platform 🚀

### A Hands-On DevOps Engineering Project

CloudOps Platform is a practical DevOps engineering project focused on building, containerizing, testing, securing, and deploying a Node.js application using modern DevOps tools and cloud infrastructure.

The project demonstrates an end-to-end DevOps workflow, combining Docker, GitHub Actions, GitHub Container Registry (GHCR), AWS EC2, and Terraform to develop a foundation for scalable and automated infrastructure management.

The goal is to progressively implement industry-relevant DevOps practices while documenting the engineering decisions, challenges, and solutions along the way.

---

## 🎯 Project Objectives

- Build and containerize a backend application using Docker.
- Implement Continuous Integration (CI) with GitHub Actions.
- Automate application testing and container image builds.
- Scan container images for security vulnerabilities.
- Publish Docker images to GitHub Container Registry.
- Deploy and run the application on AWS EC2.
- Provision and manage cloud infrastructure using Terraform.
- Develop reusable and modular Infrastructure as Code (IaC).
- Progress towards automated deployment, configuration management, and cloud-native operations.

---

## 🏗️ Architecture

The current workflow follows this architecture:

```text
              Developer
                  |
                  v
             GitHub Repo
                  |
                  v
          GitHub Actions CI
                  |
          +-------+-------+
          |               |
       Run Tests      Build Docker
                          |
                          v
                    Security Scan
                          |
                          v
                         GHCR
                  (Container Registry)
                          |
                          v
                    AWS EC2
                          |
                          v
                    Docker Engine
                          |
                          v
                  CloudOps API
```

Infrastructure provisioning is managed separately using Terraform.

---

## 🛠️ Technology Stack

| Category | Technologies |
|---|---|
| Application | Node.js |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| Container Registry | GitHub Container Registry (GHCR) |
| Cloud Platform | Amazon Web Services (AWS) |
| Compute | Amazon EC2 |
| Infrastructure as Code | Terraform |
| Infrastructure Provisioning | Terraform Modules |
| Version Control | Git & GitHub |
| Security Scanning | Trivy |
| Operating System | Ubuntu Linux |
| Development Environment | Windows Subsystem for Linux (WSL) |

---

## ⚙️ Current Implementation

### 1. Backend Application

Developed a lightweight REST API using Node.js and the built-in HTTP module.

**Available endpoints:**

| Method | Endpoint | Description |
|---|---|---|
| GET | `/health` | Returns application health status |
| GET | `/version` | Returns the current application version |

The application includes basic routing, JSON responses, environment-based configuration, and HTTP status handling.

### 2. Docker Containerization

Containerized the Node.js application using a custom Dockerfile.

Implemented:

- Docker image creation and versioning.
- Lightweight Alpine-based Node.js image.
- Container port mapping.
- Non-root container execution.
- Container health checks.
- Environment variable configuration.

### 3. Continuous Integration – GitHub Actions

Implemented a GitHub Actions workflow to automate the CI process.

The workflow includes:

- Application testing.
- Docker image building.
- Container vulnerability scanning using Trivy.
- Image publishing to GitHub Container Registry.

This helps maintain application quality and consistency throughout development.

### 4. AWS Deployment

Deployed the containerized application to an AWS EC2 instance running Ubuntu Linux.

Implemented:

- EC2-based application hosting.
- Docker Engine installation and configuration.
- Container deployment from GHCR.
- Application health verification.
- Security group configuration.
- Secure SSH access restrictions.

### 5. Infrastructure as Code – Terraform

Started managing AWS infrastructure using Terraform.

Implemented:

- AWS provider configuration.
- Terraform input variables and outputs.
- EC2 instance provisioning.
- Security group management.
- Data sources for existing AWS networking resources.
- Reusable Terraform modules for compute and networking.
- Terraform state management.
- Resource refactoring using Terraform `moved` blocks.

The infrastructure configuration is organized into reusable modules to improve maintainability and support future environment separation.

---

## 📁 Project Structure

```text
cloudops-platform/
│
├── app.js
├── package.json
├── Dockerfile
├── .dockerignore
├── .gitignore
│
├── infrastructure/
│   └── terraform/
│       ├── main.tf
│       ├── variables.tf
│       │
│       └── aws-lab/
│           ├── provider.tf
│           ├── variables.tf
│           ├── compute.tf
│           ├── network.tf
│           ├── outputs.tf
│           │
│           ├── modules/
│           │   ├── compute/
│           │   └── network/
│           │
│           └── environments/
│               ├── dev/
│               ├── staging/
│               └── production/
│
└── .github/
    └── workflows/
        └── CI workflow
```

*Note: This represents the intended project organization; some environment configurations are still being developed.*

---

## 🚀 Running Locally

### Prerequisites

- Linux, macOS, or WSL Ubuntu
- Node.js
- npm
- Docker

### Clone the repository

```bash
git clone https://github.com/laknidu777/cloudops-platform.git

cd cloudops-platform
```

### Install dependencies

```bash
npm install
```

### Start the application

```bash
npm start
```

### Access the API

```text
http://localhost:3000/health
http://localhost:3000/version
```

---

## 🐳 Running with Docker

### Build the Docker image

```bash
docker build -t cloudops-api:1.0 .
```

### Run the container

```bash
docker run -d \
  --name cloudops-api \
  -p 3000:3000 \
  cloudops-api:1.0
```

### Verify application health

```bash
curl http://localhost:3000/health
```

---

## ☁️ Infrastructure Management

Terraform configurations are located in:

```text
infrastructure/terraform/
```

The AWS lab uses reusable modules for compute and networking resources.

Useful Terraform commands:

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform output
```

**Important:** Review the execution plan before applying infrastructure changes. AWS resources may incur charges.

---

## 🔐 Security Practices

Security is considered throughout the project.

Current practices include:

- Keeping environment variables and secrets out of Git.
- Excluding Terraform state, variable files, and saved plans from version control.
- Restricting SSH access through security group rules.
- Running application containers as a non-root user.
- Scanning container images for vulnerabilities.
- Using IAM permissions for AWS access.

Never commit AWS credentials, private SSH keys, or Terraform state files containing sensitive information.

---

## 🗺️ Development Roadmap

This project is continuously evolving as additional DevOps practices are implemented.

| Component | Status |
|---|---|
| Node.js REST API | ✅ Completed |
| Docker Containerization | ✅ Completed |
| GitHub Actions CI | ✅ Completed |
| GHCR Image Publishing | ✅ Completed |
| Trivy Security Scanning | ✅ Completed |
| AWS EC2 Deployment | ✅ Completed |
| Terraform Fundamentals | ✅ Completed |
| Terraform AWS Modules | ✅ Completed |
| Terraform Environments | 🔄 In Progress |
| Ansible Configuration Management | 📌 Planned |
| Automated EC2 Deployment (CD) | 📌 Planned |
| Prometheus & Grafana Monitoring | 📌 Planned |
| Kubernetes | 📌 Planned |
| GitOps | 📌 Planned |

---

## 📚 What This Project Demonstrates

Through this project, I am developing practical experience in:

- Linux administration and command-line operations.
- Docker image creation and container management.
- CI/CD pipeline development.
- Cloud infrastructure provisioning.
- Infrastructure as Code and Terraform modules.
- AWS EC2 and networking fundamentals.
- Container security and vulnerability scanning.
- Git-based development workflows.
- Troubleshooting and operational problem-solving.

---

## 👨‍💻 Author

**Laknidu Thilakawardhana**

Aspiring DevOps Engineer | Full-Stack Developer

GitHub: [@laknidu777](https://github.com/laknidu777)

This project is part of my journey towards becoming a DevOps Engineer, with a focus on building practical skills through real-world tools, hands-on implementation, continuous learning, and engineering best practices.

---

⭐ If you find this project interesting, feel free to explore the repository and follow its development.
