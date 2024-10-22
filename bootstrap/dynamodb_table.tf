resource "aws_dynamodb_table" "terraform_statelocks" {
    name = "${var.project}-terraform-statelocks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key="LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name        = "Terraform Scaffold State lock table for account ${var.aws_account_id} in region ${var.region}"
        Environment = var.environment
        Project     = var.project
        Component   = var.component
        Account     = var.aws_account_id
    }
}