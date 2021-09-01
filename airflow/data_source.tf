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

# MWAA network
data "aws_availability_zones" "availability_zones" {
  state = "available"
}

data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    sid       = ""
    actions   = ["airflow:PublishMetrics"]
    effect    = "Allow"
    resources = ["arn:aws:airflow:${var.region}:${local.account_id}:environment/CentricityAirflow${var.environment}"]
  }

  statement {
    sid     = ""
    actions = ["s3:ListAllMyBuckets"]
    effect  = "Allow"
    resources = [
      aws_s3_bucket.s3_bucket.arn,
      "${aws_s3_bucket.s3_bucket.arn}/*",
      "${aws_s3_bucket.s3_bucket.arn}/DAGs/*"
    ]
  }

  statement {
    sid = ""
    actions = [
      "s3:GetObject*",
      "s3:GetBucket*",
      "s3:List*"
    ]
    effect = "Allow"
    resources = [
      aws_s3_bucket.s3_bucket.arn,
      "${aws_s3_bucket.s3_bucket.arn}/*",
      "${aws_s3_bucket.s3_bucket.arn}/DAGs/*"
    ]
  }

  statement {
    sid       = ""
    actions   = ["logs:DescribeLogGroups"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = ""
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:GetLogRecord",
      "logs:GetLogGroupFields",
      "logs:GetQueryResults",
      "logs:DescribeLogGroups"
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid       = ""
    actions   = ["cloudwatch:PutMetricData"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = ""
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = ""
    actions = ["secretsmanager:*"]
    effect = "Allow"
    resources = [ "*" ]
  }

  statement {        
    sid = ""
    effect = "Allow"
    actions = [
        "athena:StartQueryExecution",
        "lambda:InvokeFunction"
    ]
    resources = [
        "arn:aws:lambda:${var.region}:*",
        
        "arn:aws:athena:${var.region}:*"
    ]
  }  

  statement {    
    sid = ""
    effect = "Allow"
    actions = ["athena:StartQueryExecution"]
    resources = ["arn:aws:athena:${var.region}:*"]
  }
  
  statement {
    sid = ""
    effect = "Allow"
    actions = ["glue:*"]
    resources = ["*"]
  }
  statement {
    sid = ""
    effect = "Allow"
    actions = ["s3:*"]
    resources = ["arn:aws:s3::*"]
  }  

  statement {
    sid = ""
    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:GenerateDataKey*",
      "kms:Encrypt"
    ]
    effect        = "Allow"
    resources = ["arn:aws:kms:*:${local.account_id}:key/*"]
  }
}