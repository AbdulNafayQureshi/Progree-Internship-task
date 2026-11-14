# Progree-Internship-task
Containerized Node.js web application using a multi-stage Alpine Dockerfile and an automated multi-stage GitHub Actions CI/CD pipeline for static linting, unit testing, and Docker image builds.
# DevOps Internship Tasks – Containerization & CI/CD Pipeline

This repository contains the implementation for **Task 2 (Application Containerization & Asset Optimization)** and **Task 3 (Multi-Stage Automated CI/CD Deployment Pipeline)** as part of the DevOps Internship at **Progree**.

## Project Overview

- **Multi-Stage Docker Build (`Dockerfile`):** Uses `node:20-alpine` in a two-stage build to separate dependency installation from the minimal production runtime, running securely under a non-root user (`appuser`) with externalized `.env` configuration and port mapping (`8080:3000`).
- **Automated CI/CD Pipeline (`.github/workflows/ci-cd.yml`):** Configured with GitHub Actions to trigger automatically on every push to `main`:
  1. **Stage 1 – Static Linter & Unit Tests:** Checks out the repository, installs dependencies, runs static syntax verification, and executes tests.
  2. **Stage 2 – Container Build & Deployment Metrics:** Builds the production Docker image tagged with the commit SHA and logs execution status metrics to the GitHub Actions summary board.

## Quick Start (Local Docker Run)

```bash
# Build the optimized multi-stage image
docker build -t progree-web-app:v1 .

# Run the container with environment variables and port mapping
docker run -d -p 8080:3000 --env-file .env --name my-web-app progree-web-app:v1
