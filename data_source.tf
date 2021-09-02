#Get Account ID for names of Roles/Policies
data "aws_caller_identity" "current" {
  provider = aws.current
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  tags = {
    Author = "Terraform"
  }
}