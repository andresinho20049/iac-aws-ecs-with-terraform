# iac-aws-ecs-with-terraform

A comprehensive Terraform configuration for deploying a scalable and highly available AWS Elastic Container Service (ECS) cluster with multiple services, tasks, and load balancers.

**Table of Contents**
 - Overview
 - Features
 - Requirements
 - Usage
 - Notes


## Overview
This repository provides a Terraform configuration to deploy an AWS ECS cluster with multiple services, tasks, and load balancers. The configuration uses best practices for security, scalability, and high availability.

### Architecture
The architecture consists of:

ECS Cluster: A scalable and highly available ECS cluster with multiple instances.
Services: Multiple ECS services, each with its own task definition, container instance, and load balancer.
Load Balancers: Elastic Load Balancers (ELBs) to distribute traffic across the ECS services.
Container Registry: An AWS Elastic Container Registry (ECR) to store and manage container images.

## Features
* **Scalable ECS Cluster**: A highly available ECS cluster with multiple instances, allowing for easy scaling and high availability.
* **Multiple Services**: Multiple ECS services, each with its own task definition, container instance, and load balancer.
* **Load Balancing**: Elastic Load Balancers (ELBs) to distribute traffic across the ECS services.
* **Container Registry**: An AWS Elastic Container Registry (ECR) to store and manage container images.
* **CloudWatch Alarms**: CloudWatch alarms to monitor the ECS cluster's performance and trigger notifications.
* **Security Groups**: Security groups to control inbound and outbound traffic for the ECS instances.

## Requirements
* **AWS Account**: An existing AWS account with necessary permissions (e.g., IAM user or root account).
* **Terraform**: Terraform version 1.3.4 or later installed on your machine.
* **ECR Credentials**: ECR credentials to access and manage container images.

## Usage
1. **Clone the Repository**: Clone this repository to your local machine using `git clone https://github.com/andresinho20049/iac-aws-ecs-with-terraform.git`.
2. **Update Variables**: Update the `variables.tf` file with your environment-specific values (e.g., AWS region, account ID, ECR repository names).
3. **Run Terraform**: Run `terraform init` and `terraform apply` to deploy the ECS cluster.
4. **Verify Deployment**: Verify the deployment using the AWS console or Terraform output.

## Notes
* This configuration assumes you have an existing AWS account with necessary permissions (e.g., IAM user or root account).
* The configuration uses default values for some parameters, so be sure to review and update them according to your environment.
* This is just a starting point; you may need to modify the configuration to suit your specific use case.

I hope this helps! Let me know if you have any further questions.

> Dev: [Andresinho20049](https://andresinho20049.com.br)
