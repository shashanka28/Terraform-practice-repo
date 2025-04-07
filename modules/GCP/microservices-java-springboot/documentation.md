A FinTech company is migrating its Java Spring Boot microservices from on-prem to Google Cloud Platform (GCP) for improved scalability and cost efficiency. And uses following features.,

Infrastructure as Code (IaC) using Terraform for automated provisioning.

Secure storage of secrets using Google Secret Manager.

Containerized deployments with GKE (Google Kubernetes Engine).

CI/CD using GitLab Pipelines to automate deployments.

Security scans integrated with Veracode and Qualys.

Networking setup including VPC, subnets, firewall rules, and IAM roles.

Logging and monitoring using Google Cloud Logging & Cloud Monitoring.


gcp-terraform-project/
│── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── gke/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── storage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── secret-manager/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── monitoring/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│
│── environments/
│   ├── dev/
│   │   ├── backend.tfvars
│   │   ├── variables.tfvars
│   ├── prod/
│   │   ├── backend.tfvars
│   │   ├── variables.tfvars
│
│── ci-cd/
│   ├── gitlab-ci.yml
│
│── main.tf
│── variables.tf
│── outputs.tf
│── provider.tf
│── terraform.tfvars
│── README.md
