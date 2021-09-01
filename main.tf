module "test_airflow" {
    source = "./airflow"
    environment = "test"
    region = "us-east-1"
    #VPC
    vpc_cidr = "160.32.0.0/24"
    public_subnet_cidrs = ["160.32.0.0/27", "160.32.0.32/27"]
    private_subnet_cidrs = ["160.32.0.64/27", "160.32.0.96/27"]
    #s3 Buckets
    create_buckets = true
    bucket_unique_ids = ["test-airflow-dags", "test-airflow-3210"]
}