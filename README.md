# DevOps Challenge - Technical Test Documentation

### Overview

This repository contains the infrastructure and deployment setup for a Python application using AWS EC2, Terraform, and Jenkins for CI/CD automation.

### Architecture

AWS EC2 for running the containerized application.

Terraform for Infrastructure as Code (IaC).

Jenkins for building and deploying the Docker image.

AWS ECS for managing the service and task definitions.

AWS VPC, Subnets, Security Groups for network configuration.

### Prerequisites

AWS CLI installed and configured.

Terraform installed.

Docker installed.

Jenkins installed and configured.

### Setup Instructions

1. Clone the repository
    1. git clone [<devops_challenge_day_1>](https://github.com/Jorge-DevOps/devops_challenge_day_1)
    2. cd devops_challenge_day_1
2. Configure Terraform Variables
    1. Modify terraform.tfvars with your AWS settings
3. Initialize Terraform
    1. terraform init
4. Plan and Apply Terraform
    1. terraform plan
    terraform apply -auto-approve
5. Verify Resources
    1. Check Terraform state:
    terraform state list

# Running the Microservice Locally

You can run the microservice locally using Docker:

## Run the container

```yaml
cd devops_challenge_day_1/ci-cd
docker-compose build
docker-compose up -d 
```

Once running, the service should be accessible at:

[http://localhost:8080/hello](http://localhost:8080/)

### CI/CD Pipeline Flow

- The pipeline in Jenkins follows these stages:
    - Build: Pulls the latest code and builds the Docker image.
    - Test: Runs unit tests (if applicable).
    - Push: Pushes the image to Docker Hub.
- Tools Used
    - Jenkins: CI/CD automation
    - Docker: Containerization
    - Terraform: Infrastructure as Code (IaC)
    - AWS ES2 : Instance

### Future Improvements

- Deploy: Updates the ECS service using Terraform and Jenkins.
- Configure HTTPS with an ALB (Application Load Balancer).
- Implement autoscaling for ECS service.
- Add security checks in the pipeline (e.g., SAST tools like SonarQube).
- Improve logging and monitoring using AWS CloudWatch.

### Execution Logs & Screenshots

- Successful Pipeline Execution:
    
    ![image.png](https://resourses.site/jorgerangel/Screenshot1.png)

    ![image.png](https://resourses.site/jorgerangel/Screenshot2.png)
        
    ![image.png](https://resourses.site/jorgerangel/Screenshot4.png)
        
- Successful Execution Service:
    
    
    ![Screenshot From 2025-02-10 12-02-36.png](https://resourses.site/jorgerangel/Screenshot3.png)
    
    ![image.png](https://resourses.site/jorgerangel/Screenshot5.png)
