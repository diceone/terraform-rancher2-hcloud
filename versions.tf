
terraform {
  required_version = ">= 0.13"
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    template = {
      source = "hashicorp/template"
    }
  }
}
