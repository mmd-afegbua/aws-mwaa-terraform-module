# aws-mwaa-terraform-module

# Terraform Module for Amazon Managed Workspace for Apache Airflow
Resources declared are:
```
1.VPC:
    * VPC Endpoints
    * Natgateway
    * Subnets
    * Internet Gateway
    * Public and Private Router
    * Security Group
    * Route Tables
2.ROLE:
    * Airflow execution role
    * Role Policies
3.S3 Bucket:
    * DAGs
4.MWAA    
```

For efficient implementaton, you need a minimum of three files in your application folder:
main.tf
provider.tf
data.tf

#### main.tf
```
module "test_airflow" {
    source = "github.com/mmdafegbua/aws-mwaa-terraform-module.git?ref=main"
    account_id = local.account_id    
    environment = "test"
    region = "us-east-1"
    #VPC
    vpc_cidr = "180.32.0.0/24"
    public_subnet_cidrs = ["180.32.0.0/27", "180.32.0.32/27"]
    private_subnet_cidrs = ["180.32.0.64/27", "180.32.0.96/27"]
    #s3 Buckets
    create_buckets = true
    bucket_unique_ids = ["test-airflow-dags", "test-airflow-3210"]
}
```