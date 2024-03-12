terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {}

resource "random_integer" "example" {
  min = 1
  max = 100
}

output "random_integer" {
  value = random_integer.example.result
}

data "external" "random" {
  program = ["${path.module}/random.sh"]
}

output "random_value_dynamic" {
  value = data.external.random.result["random_value"]
}
