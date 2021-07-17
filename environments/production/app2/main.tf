terraform {
  backend "remote" {
  organization = "myorg"

  workspaces {
      name = "devops"
  }

  }
}

module "app1" {
  source  = "../../app1"
  version = "1.2.20"

  environment                               = var.environment
  cidr_block                                = var.cidr_block
}