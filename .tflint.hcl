config {
  # Add configuration details, for example, to ignore specific rules
}

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.24.0" # Use a specific version, such as the latest stable one
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}