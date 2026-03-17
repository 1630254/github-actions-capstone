# 🚀 DevOps Capstone: Automated Flask Deployment

A production-ready CI/CD pipeline demonstrating automated testing, containerization, and multi-tagging strategies using GitHub Actions and Docker Hub.

---

## 🛠 Tech Stack
- **Backend:** Python 3.11 (Flask)  
- **Database:** PostgreSQL & Redis  
- **Containerization:** Docker & Docker Buildx  
- **CI/CD:** GitHub Actions (Reusable Workflows)  
- **Registry:** Docker Hub  

---

## 🏗 Project Architecture
The project is structured to follow the **#90DaysOfDevOps** challenge best practices, focusing on modularity and security.

### Key Features
- **Reusable Workflows:** Modularized YAML files for testing and Docker builds to reduce code duplication.  
- **Multi-Tagging Strategy:** Every push to `main` generates a `:latest` image and a unique `:sha-7char` image for immutable deployments.  
- **Optimized Builds:** Uses Docker Buildx with GHA caching and `provenance: false` to ensure clean, single-entry manifests on Docker Hub.  
- **Health Checks:** Integrated Docker Compose health checks for the database and cache layers.  

---

## 🚀 Getting Started

### Prerequisites
- Docker & Docker Compose installed locally.  
- GitHub Secrets configured (`DOCKER_USERNAME`, `DOCKER_TOKEN`).  

### Local Development
To run the entire stack locally:

```bash
docker-compose up --build
```
## ⚙️ GitHub Actions Pipeline
Our pipeline consists of four main stages:

1. **Test:** Runs Python linting and unit tests via `.reusable-build-test.yml`.  
2. **Prepare:** Extracts the short git commit hash.  
3. **Build & Push:** Builds the image using Buildx and pushes to Docker Hub via `.reusable-docker.yml`.  
4. **Deploy:** A simulated CD step that references the specific SHA-tagged image.  

---

## 📦 Docker Hub Repository
We can find our automated builds here:  
**Docker Hub Repository** [(hub.docker.com in Bing)](https://www.bing.com/search?q=hub.docker.com)

---

## 📝 Roadmap & Learning Milestones
- [x] Containerize Flask application.  
- [x] Orchestrate multi-service stack with Docker Compose.  
- [x] Implement Reusable Workflows in GitHub Actions.  
- [x] Resolve Buildx insufficient_scope and manifest clutter issues.  



[![Reusable Build and Test (Flask Web)](https://github.com/1630254/github-actions-capstone/actions/workflows/reusable-build-test.yml/badge.svg)](https://github.com/1630254/github-actions-capstone/actions/workflows/reusable-build-test.yml)

[![Reusable Docker Build and Push](https://github.com/1630254/github-actions-capstone/actions/workflows/reusable-docker.yml/badge.svg)](https://github.com/1630254/github-actions-capstone/actions/workflows/reusable-docker.yml)

[![Main CD Pipeline](https://github.com/1630254/github-actions-capstone/actions/workflows/main-pipeline.yml/badge.svg)](https://github.com/1630254/github-actions-capstone/actions/workflows/main-pipeline.yml)

[![Scheduled Health Check](https://github.com/1630254/github-actions-capstone/actions/workflows/health-check.yml/badge.svg)](https://github.com/1630254/github-actions-capstone/actions/workflows/health-check.yml)
