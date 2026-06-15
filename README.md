# Multi-Service Node.js E-commerce Deployment Using Terraform and Docker

## Project Overview

This project demonstrates the deployment of a multi-service Node.js E-commerce application on AWS using Terraform and Docker.

The application consists of one frontend service and four backend microservices:

| Service         | Port |
| --------------- | ---- |
| Frontend        | 3000 |
| User Service    | 3001 |
| Product Service | 3002 |
| Cart Service    | 3003 |
| Order Service   | 3004 |

All services are containerized using Docker and deployed automatically on an AWS EC2 instance provisioned through Terraform.

## Architecture

```text
MacBook
   |
   | Terraform Apply
   |
AWS Cloud
 ├── Default VPC
 ├── Security Group
 ├── EC2 Instance
 │
 ├── Frontend Container (3000)
 ├── User Service (3001)
 ├── Product Service (3002)
 ├── Cart Service (3003)
 └── Order Service (3004)
```

## Technologies Used

### Application

* Node.js
* Express.js
* React

### DevOps

* Docker
* DockerHub
* Terraform
* AWS EC2
* AWS VPC
* Security Groups

## Docker Images

DockerHub Repository:

```text
dockerhub-username/frontend:v1
dockerhub-username/user-service:v1
dockerhub-username/product-service:v1
dockerhub-username/cart-service:v1
dockerhub-username/order-service:v1
```

## Local Build and Test

Build Docker Images

```bash
docker build -t frontend ./frontend

docker build -t user-service ./backend/user-service

docker build -t product-service ./backend/product-service

docker build -t cart-service ./backend/cart-service

docker build -t order-service ./backend/order-service
```

Run Containers

```bash
docker run -d -p 3000:3000 frontend

docker run -d -p 3001:3001 user-service

docker run -d -p 3002:3002 product-service

docker run -d -p 3003:3003 cart-service

docker run -d -p 3004:3004 order-service
```

Verify:

```bash
docker ps
```


## Push Images to DockerHub

```bash
docker login

docker push dockerhub-username/frontend:v1

docker push dockerhub-username/user-service:v1

docker push dockerhub-username/product-service:v1

docker push dockerhub-username/cart-service:v1

docker push dockerhub-username/order-service:v1
```

## Terraform Infrastructure

Terraform provisions:

* Default VPC
* Security Group
* EC2 Instance
* Docker Installation
* Container Deployment

Files:

```text
terraform/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
```

## Deploy Infrastructure

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Deploy

```bash
terraform apply
```

Destroy Resources

```bash
terraform destroy
```

## Access Application

After deployment Terraform outputs the EC2 Public IP.

Example:

```text
http://13.xx.xx.xx:3000
```

Frontend Output:

```text
Frontend is Live
```

Backend Services:

```text
http://13.xx.xx.xx:3001
http://13.xx.xx.xx:3002
http://13.xx.xx.xx:3003
http://13.xx.xx.xx:3004
```


## Verification

Check running containers:

```bash
docker ps
```

Expected:

```text
frontend
user-service
product-service
cart-service
order-service
```

---

## Screenshots Included

* Docker Image Build
* DockerHub Repository
* Terraform Apply Output
* EC2 Instance Running
* Docker Containers Running
* Frontend Accessible Through Public IP


DockerHub: https://hub.docker.com/repositories/rahulkumarprajapati
