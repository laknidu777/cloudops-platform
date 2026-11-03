# CloudOps Platform 🚀

### End-to-End DevOps, Cloud Infrastructure & Automation Project

CloudOps Platform is an end-to-end DevOps engineering project designed to implement modern software delivery, cloud infrastructure management, automation, security, monitoring, and container orchestration practices.

The project focuses on building and maintaining a reliable application delivery platform using industry-standard DevOps tools and technologies.

It combines containerization, Continuous Integration and Continuous Delivery (CI/CD), Infrastructure as Code (IaC), configuration management, cloud computing, monitoring, and GitOps to establish a practical DevOps workflow.

The primary objective is to develop a production-oriented cloud environment that supports automated application builds, secure deployments, infrastructure provisioning, operational monitoring, and scalable application management.

---

## 🏗️ Architecture Overview

The platform is designed around an automated software delivery and infrastructure management workflow.

```text
                     Developer
                         |
                         v
                   Git & GitHub
                         |
                         v
                  GitHub Actions
                         |
              +----------+----------+
              |                     |
          Run Tests             Build Image
                                    |
                                    v
                              Security Scan
                                    |
                                    v
                         GitHub Container Registry
                                    |
                                    v
                           Deployment Automation
                                    |
                         +----------+----------+
                         |                     |
                      Ansible              Kubernetes
                         |                     |
                         v                     v
                      AWS EC2             Container Pods
                         |                     |
                         +----------+----------+
                                    |
                              Application
                                    |
                                    v
                           Prometheus & Grafana
                                    |
                                    v
                         Monitoring & Alerting


                Infrastructure Provisioning
                              |
                           Terraform
                              |
                              v
                         AWS Resources
```

The architecture represents the broader target design. Some components, including Ansible automation, Kubernetes and GitOps, are planned for implementation.

---

## 🛠️ Technology Stack

The project brings together the following technologies.

### Application Development
- **Node.js** – Backend application runtime.
- **JavaScript** – Application development.
- **REST API** – HTTP endpoints for application health and version information.

### Containerization
- **Docker** – Application containerization.
- **Dockerfile** – Reproducible container image builds.
- **Docker Engine** – Container execution and management.
- **Docker Health Checks** – Container health verification.

### CI/CD & Version Control
- **Git** – Source control and version management.
- **GitHub** – Source code hosting and collaboration.
- **GitHub Actions** – Automated CI/CD workflows.
- **GitHub Container Registry (GHCR)** – Container image storage and distribution.

### Cloud Infrastructure
- **Amazon Web Services (AWS)** – Cloud infrastructure platform.
- **Amazon EC2** – Virtual machine hosting.
- **AWS VPC** – Virtual networking.
- **AWS Security Groups** – Network access control.
- **AWS IAM** – Identity and access management.
- **AWS CLI** – Command-line interaction with AWS.

### Infrastructure as Code & Configuration Management
- **Terraform** – Infrastructure provisioning and lifecycle management.
- **Terraform Modules** – Reusable infrastructure components.
- **Ansible** – Server configuration management, application deployment, and automation.

### Security
- **Trivy** – Container vulnerability scanning.
- **Secret Scanning** – Detection of accidentally exposed credentials.
- **Linux Security** – User permissions and server hardening.
- **IAM** – Access control and least-privilege practices.

### Monitoring & Observability
- **Prometheus** – Metrics collection and monitoring.
- **Grafana** – Monitoring dashboards and visualization.
- **Centralized Logging** – Application and infrastructure log management.
- **Alerting** – Detection and notification of operational issues.

### Container Orchestration & GitOps
- **Kubernetes** – Container orchestration.
- **Helm** – Kubernetes application packaging and deployment.
- **Argo CD** – GitOps-based continuous delivery.

### Operating Systems & Development Environment
- **Ubuntu Linux** – Server and development environment.
- **Windows Subsystem for Linux (WSL)** – Linux development environment on Windows.
- **Bash** – Command-line automation and scripting.

---

## 🔄 Continuous Integration & Delivery

The project uses GitHub Actions to automate the application build and validation workflow.

The CI pipeline is designed to:

- Run automated application tests.
- Build Docker images.
- Perform vulnerability scanning using Trivy.
- Publish successful container images to GHCR.
- Tag images using `latest` and commit SHA identifiers.

The deployment workflow is being developed to support automated application updates, health verification, and rollback to previous container image versions.

---

## ☁️ Cloud Infrastructure & Automation

AWS provides the cloud infrastructure for hosting the application and supporting DevOps operations.

Terraform is used to define and manage infrastructure as code.

The infrastructure includes:

- EC2 instances.
- Security groups.
- VPC and subnet integration.
- Reusable compute and networking modules.
- Terraform variables and outputs.
- Infrastructure state management.
- Environment-specific infrastructure configuration.

Ansible is intended to automate server configuration and deployment tasks, reducing the need for repetitive manual server administration.

---

## 🔐 Security & Reliability

Security and reliability are integrated into the platform's engineering approach.

Key practices include:

- Container vulnerability scanning with Trivy.
- Secure handling of environment variables and credentials.
- Excluding sensitive files and Terraform state from Git.
- Restricting SSH access through security group rules.
- Running application containers as non-root users.
- Reviewing exposed ports and network access.
- Using AWS IAM permissions for infrastructure operations.
- Maintaining identifiable container image versions.
- Documenting deployment verification and rollback procedures.

---

## 📊 Monitoring & Operations

Prometheus and Grafana will provide visibility into application and infrastructure performance.

The monitoring approach will include:

- Application and container health monitoring.
- Metrics collection.
- Performance dashboards.
- Centralized application logging.
- Alerting and incident investigation.
- Troubleshooting and operational runbooks.

---

## ☸️ Kubernetes & GitOps

Kubernetes will be used to explore container orchestration and scalable application deployment.

The planned implementation includes:

- Deployments and Services.
- ConfigMaps and application configuration.
- Readiness and liveness probes.
- Resource requests and limits.
- Helm charts for application packaging.
- Argo CD for GitOps-based deployment management.

This will extend the platform from individual Docker containers on EC2 towards a declarative container orchestration environment.

---

## 📁 Repository Structure

```text
cloudops-platform/
│
├── app.js
├── package.json
├── Dockerfile
├── .dockerignore
├── .gitignore
│
├── .github/
│   └── workflows/
│       └── CI workflow
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
└── README.md
```

Additional Ansible, monitoring, and Kubernetes configuration directories will be incorporated as those components are implemented.

---

## 🚀 Local Setup

### Prerequisites

- Linux, macOS, or WSL Ubuntu.
- Node.js and npm.
- Docker.
- Git.

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

### Test the API

```bash
curl http://localhost:3000/health

curl http://localhost:3000/version
```

### Build and run with Docker

```bash
docker build -t cloudops-api:1.0 .
```

```bash
docker run -d \
  --name cloudops-api \
  -p 3000:3000 \
  cloudops-api:1.0
```

---

## 💡 Engineering Focus

CloudOps Platform is focused on developing practical engineering experience in:

- Designing and maintaining CI/CD pipelines.
- Containerizing and deploying backend applications.
- Managing cloud infrastructure through Infrastructure as Code.
- Automating server configuration and deployments.
- Implementing container and infrastructure security practices.
- Monitoring application health and infrastructure performance.
- Managing container orchestration and GitOps workflows.
- Troubleshooting deployment and infrastructure issues.
- Applying version control and automation throughout the software delivery lifecycle.

---

## 👨‍💻 Author

**Laknidu Thilakawardhana**

Aspiring DevOps Engineer | Full-Stack Developer

GitHub: [@laknidu777](https://github.com/laknidu777)

**CloudOps Platform** is a continuous hands-on engineering project focused on developing practical DevOps skills and applying modern cloud, automation, infrastructure, and operational technologies to a real application environment.

