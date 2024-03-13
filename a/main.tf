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
  value = random_integer.example.result + 2
}
