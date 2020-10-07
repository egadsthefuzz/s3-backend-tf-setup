# You cannot create a new backend by simply defining this and then
# immediately proceeding to "terraform apply". The S3 backend must
# be bootstrapped according to the simple yet essential procedure in
# https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
module "terraform_state_backend" {
  source     = "git::https://github.com/egadsthefuzz/terraform-aws-tfstate-backend.git?ref=safety-changes"
  namespace  = "egadsthefuzz"
  stage      = "test"
  name       = "terraform"
  attributes = ["statestore"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}
# Set AWS as the provider and establish creds and default region
provider aws {
  shared_credentials_file = var.shared_credentials
  profile = var.profile
  region = var.region
}
