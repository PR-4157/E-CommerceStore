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

## STEP 1: Install Required Tools on Mac

terraform -version
docker --version
brew install awscli
aws --version

<img width="814" height="506" alt="Screenshot 2026-06-14 at 5 11 26 PM" src="https://github.com/user-attachments/assets/c0e45ea8-1865-47b9-9a79-2a90af9baf05" />

<img width="816" height="652" alt="Screenshot 2026-06-14 at 5 11 37 PM" src="https://github.com/user-attachments/assets/135cc4e8-94d6-41e6-999d-0b5aab95f10c" />

## STEP 2: Configure AWS

aws configure

<img width="815" height="260" alt="Screenshot 2026-06-14 at 5 11 43 PM 1" src="https://github.com/user-attachments/assets/62fc90f0-2f1f-412f-83aa-24b0b0199f83" />

## STEP 3: Create Project Structure

mkdir ecommerce-devops
cd ecommerce-devops
mkdir frontend user-service products-service orders-service cart-service terraform

<img width="820" height="253" alt="Screenshot 2026-06-14 at 5 11 55 PM" src="https://github.com/user-attachments/assets/5b227e1d-dfc5-40f1-b4af-8571c55d0810" />

## STEP 4: Create Backend Services

cd user-service
npm install

<img width="818" height="295" alt="Screenshot 2026-06-14 at 5 11 56 PM" src="https://github.com/user-attachments/assets/874fca5b-ed85-4478-bb81-0b9c90245e1a" />

cd ../products-service
npm install

<img width="818" height="212" alt="Screenshot 2026-06-14 at 5 11 57 PM" src="https://github.com/user-attachments/assets/2e2d743c-1134-44b3-906c-a1fd4a391786" />

cd ../orders-service
npm install

<img width="816" height="226" alt="Screenshot 2026-06-14 at 5 12 01 PM" src="https://github.com/user-attachments/assets/72b88739-b5bd-4b0d-87fa-8101b90aec0e" />

cd ../cart-service
npm install

<img width="815" height="212" alt="Screenshot 2026-06-14 at 5 12 07 PM" src="https://github.com/user-attachments/assets/33ee0655-1719-4060-bd8c-8b7dfd2d7808" />

node server.js 

<img width="818" height="172" alt="Screenshot 2026-06-14 at 5 12 07 PM 1" src="https://github.com/user-attachments/assets/4001a09a-ef9e-4ef0-820b-747c7cecbeeb" />

<img width="818" height="182" alt="Screenshot 2026-06-14 at 5 12 18 PM" src="https://github.com/user-attachments/assets/0d0c179b-ca64-4b5c-937d-a7cce2350693" />

cd ~/ecommerce-devops/frontend
npm install
node server.js

<img width="816" height="268" alt="Screenshot 2026-06-14 at 5 12 19 PM" src="https://github.com/user-attachments/assets/cc65c7ac-8860-4927-9abe-f32ac844e5ba" />


curl http://localhost:3001
curl http://localhost:3002
curl http://localhost:3003
curl http://localhost:3004
curl http://localhost:3000

<img width="511" height="211" alt="Screenshot 2026-06-14 at 4 26 15 PM" src="https://github.com/user-attachments/assets/8fcb9041-9d5f-41eb-b5af-413dcde16262" />

## STEP 6: Build Images

cd ~/ecommerce-devops/user-service
docker build -t user-service .
docker run -p 3001:3001 user-service

<img width="816" height="425" alt="Screenshot 2026-06-15 at 1 16 47 AM" src="https://github.com/user-attachments/assets/88507953-d70f-40b8-8ba8-3e2a732e4d00" />

cd ~/ecommerce-devops/products-service
docker build -t products-service .
docker run -p 3002:3002 products-service

<img width="706" height="421" alt="Screenshot 2026-06-15 at 1 17 31 AM" src="https://github.com/user-attachments/assets/e103a64d-2da3-4a0c-ab96-5754af037768" />

cd ~/ecommerce-devops/orders-service
docker build -t orders-service .
docker run -p 3003:3003 orders-service

<img width="770" height="422" alt="Screenshot 2026-06-15 at 1 17 53 AM" src="https://github.com/user-attachments/assets/dd273ee3-0708-44b8-a9d2-b7978849e5f0" />

cd ~/ecommerce-devops/cart-service
docker build -t cart-service .
docker run -p 3004:3004 cart-service

<img width="740" height="426" alt="Screenshot 2026-06-16 at 1 15 31 AM" src="https://github.com/user-attachments/assets/5f494ef0-c69c-47d7-b703-d3c26792f05d" />

cd ~/ecommerce-devops/frontend
docker build -t frontend .
docker run -p 3000:3000 frontend

<img width="676" height="437" alt="Screenshot 2026-06-16 at 1 25 49 AM" src="https://github.com/user-attachments/assets/d3b33ea7-15e5-4ec0-b7ce-866927c4ff5f" />

docker ps 

<img width="1006" height="189" alt="Screenshot 2026-06-16 at 1 10 10 AM" src="https://github.com/user-attachments/assets/b02ab152-660f-45b3-add3-95b14fc28946" />

## STEP 7: Push Images to DockerHub

docker login
docker images

<img width="998" height="211" alt="Screenshot 2026-06-16 at 1 11 14 AM" src="https://github.com/user-attachments/assets/71e70878-d760-4a10-b77c-bb1318a8d939" />

<img width="801" height="168" alt="Screenshot 2026-06-15 at 6 48 06 PM" src="https://github.com/user-attachments/assets/0b091f20-90a6-4dde-ad35-9d2a883db8d3" />

### Docker Images

DockerHub Repository:
docker push rahulkumarprajapati/user-service:v1

<img width="1612" height="482" alt="image" src="https://github.com/user-attachments/assets/29573e35-8c8b-4980-93de-24b6a7b00377" />

docker push rahulkumarprajapati/products-service:v1

<img width="1612" height="486" alt="image" src="https://github.com/user-attachments/assets/bff86ba4-1d8d-4d67-8d2d-2dff94ddf187" />

docker push rahulkumarprajapati/orders-service:v1

<img width="1606" height="476" alt="image" src="https://github.com/user-attachments/assets/e33f230e-1191-48bd-931e-ad21c815ddf7" />

docker push rahulkumarprajapati/cart-service:v1

<img width="1614" height="484" alt="image" src="https://github.com/user-attachments/assets/a47076d3-0663-4b3f-accc-a33f5e48a686" />

docker push rahulkumarprajapati/frontend:v1

<img width="1620" height="486" alt="image" src="https://github.com/user-attachments/assets/10ccfe33-d373-4c0d-93e2-74ffd15c6aae" />

### Docker Hub Repositories

<img width="1131" height="536" alt="Screenshot 2026-06-16 at 1 45 36 AM" src="https://github.com/user-attachments/assets/1f07c43d-2e37-4f9a-87ee-fa18e90a1ac7" />

## STEP 8: Terraform Folder
cd ~/ecommerce-devops/terraform
touch provider.tf main.tf variables.tf outputs.tf

<img width="799" height="116" alt="Screenshot 2026-06-15 at 6 50 16 PM" src="https://github.com/user-attachments/assets/0497c436-7c2b-45aa-ae94-2b8e67fe7cef" />

Files:

```text
terraform/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
```

## Step 9: Deploy Infrastructure

- Initialize Terraform
terraform init
- Validate
terraform validate

<img width="2016" height="736" alt="image" src="https://github.com/user-attachments/assets/6ed8acdd-a5ff-47f1-8074-ca1d9f657f89" />

- Plan
terraform plan
- Deploy
terraform apply

<img width="2014" height="846" alt="image" src="https://github.com/user-attachments/assets/1e06b1c4-1cf9-45a8-8142-d0f37603874b" />

<img width="1010" height="392" alt="Screenshot 2026-06-16 at 1 55 13 AM" src="https://github.com/user-attachments/assets/d9a8e0b3-1408-4d7f-a6d0-ab09662b0f9c" />

<img width="2016" height="566" alt="image" src="https://github.com/user-attachments/assets/97fff4f6-1ee0-49ee-945e-cb160b758b09" />

## STEP 10: Get Public IP

After deployment Terraform outputs the EC2 Public IP.
terraform output
- Public_ip: 13.203.78.88

http://13.203.78.88:3000

<img width="2260" height="650" alt="image" src="https://github.com/user-attachments/assets/81dc5088-d10e-4fa3-8d7e-5345931d6089" />

Backend Services:
http://13.203.78.88:3001

<img width="2258" height="526" alt="image" src="https://github.com/user-attachments/assets/a759e835-8212-443a-882b-ce45f159d7cf" />

http://13.203.78.88:3002

<img width="2262" height="504" alt="image" src="https://github.com/user-attachments/assets/ea6985d1-8a78-420d-824d-80fe2989ebd9" />

http://13.203.78.88:3003

<img width="2260" height="444" alt="image" src="https://github.com/user-attachments/assets/6611f39d-ed87-4908-b541-d5f77e87ea5b" />

http://13.203.78.88:3004

<img width="2258" height="484" alt="image" src="https://github.com/user-attachments/assets/c7a34109-65ee-468e-9aa1-8d12b875efc3" />

## Verification

Check running containers:
Expected:

```text
frontend
user-service
product-service
cart-service
order-service
```

<img width="1135" height="582" alt="Screenshot 2026-06-16 at 2 06 31 AM" src="https://github.com/user-attachments/assets/316cf410-96f0-415c-9bcb-d613ac098d8a" />

<img width="2281" height="1546" alt="image" src="https://github.com/user-attachments/assets/adfd90c4-8a90-4dce-a8b4-3aed3a61d1a9" />

## Screenshots Included

* EC2 Instance Running
<img width="1235" height="779" alt="Screenshot 2026-06-16 at 2 08 02 AM" src="https://github.com/user-attachments/assets/e511f849-47c8-4bac-9fcd-7c9bd20b9dc9" />

<img width="1233" height="517" alt="Screenshot 2026-06-15 at 9 34 04 PM" src="https://github.com/user-attachments/assets/fd7e4634-5946-4947-b19d-d2e595d75fc9" />

<img width="1235" height="780" alt="Screenshot 2026-06-14 at 4 04 02 PM" src="https://github.com/user-attachments/assets/fd476529-e9fc-4191-a77e-732a05baeb74" />

<img width="1238" height="480" alt="Screenshot 2026-06-14 at 4 03 49 PM" src="https://github.com/user-attachments/assets/22e96a40-3891-481e-aee1-e91f8e8803d8" />

<img width="1009" height="381" alt="Screenshot 2026-06-16 at 2 14 12 AM" src="https://github.com/user-attachments/assets/1a90e997-43ee-4f07-96eb-545834212e81" />

<img width="1009" height="268" alt="Screenshot 2026-06-16 at 2 14 25 AM" src="https://github.com/user-attachments/assets/9263f5ba-4345-495b-9177-184ca5f85566" />

<img width="1008" height="140" alt="Screenshot 2026-06-16 at 2 14 43 AM" src="https://github.com/user-attachments/assets/dd42bbd6-e3cd-420a-9f4c-54cca99b96d5" />

<img width="1009" height="142" alt="Screenshot 2026-06-16 at 2 14 55 AM" src="https://github.com/user-attachments/assets/39d7bbe2-c8c1-46e6-9e2b-5dd4fee03a3d" />

<img width="1009" height="141" alt="Screenshot 2026-06-16 at 2 15 10 AM" src="https://github.com/user-attachments/assets/37fd3fcf-e352-4dbf-a979-6cbdc4db34d1" />

<img width="1009" height="142" alt="Screenshot 2026-06-16 at 2 15 23 AM" src="https://github.com/user-attachments/assets/dea9e3db-808d-4f1f-8602-99f20810f791" />

<img width="1007" height="354" alt="Screenshot 2026-06-16 at 2 15 43 AM" src="https://github.com/user-attachments/assets/b772d73e-d6ae-4683-9eb8-c08adf713c74" />

- DockerHub: https://hub.docker.com/repositories/rahulkumarprajapati

## Conclusion

Terraform was used to provision AWS infrastructure and Docker was used to deploy five Node.js services. The frontend service is publicly accessible, while backend services run inside Docker containers on the EC2 instance. The deployment is fully reproducible using terraform apply.

## Summary 

The project successfully deployed a multi-service Node.js e-commerce application using Docker and Terraform on AWS. Terraform automated the provisioning of EC2 infrastructure and security groups, while Docker ensured consistent deployment of all five services. The frontend was made publicly accessible through the EC2 public IP, and all backend services were verified to be running successfully. The entire setup is reproducible using Terraform, demonstrating Infrastructure as Code (IaC) and containerized application deployment practices.
