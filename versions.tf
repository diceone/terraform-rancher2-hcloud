
terraform {
  required_version = ">= 1.0.7"
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    template = {
      source = "hashicorp/template"
    }
  }
}
