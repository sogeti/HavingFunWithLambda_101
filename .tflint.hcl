plugin "aws" {
    enabled = true
    version = "0.14.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "terraform_standard_module_structure" {
    enabled = true
}

rule "terraform_comment_syntax" {
    enabled = true
}

rule "terraform_documented_outputs" {
    enabled = true
}

rule "terraform_documented_variables" {
    enabled = true
}
