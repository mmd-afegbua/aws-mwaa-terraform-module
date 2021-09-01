output "vpc_id" {
  value       = module.test_airflow.vpc_id
  description = "ID of the VPC."
}

output "public_subnets_ids" {
  value       = module.test_airflow.public_subnets_ids
  description = "List with the IDs of the public subnets."
}

output "private_subnets_ids" {
  value       = module.test_airflow.private_subnets_ids
  description = "List with the IDs of the private subnets."
}

output "s3_bucket_id" {
  value       = module.test_airflow.s3_bucket_id
  description = "ID of S3 bucket."
}

output "mwaa_environment_arn" {
  value       = module.test_airflow.mwaa_environment_arn
  description = "ARN of MWAA environment."
}

output "mwaa_web_url" {
  value = module.test_airflow.mwaa_web_url
  description = "URL of Airflow UI"
}