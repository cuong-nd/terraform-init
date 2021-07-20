module "shared" {
  source = "./shared"
  var1   = var.shared
}

module "app1" {
  source = "./app1"
  var1   = var.var1
}

module "app2" {
  source = "./app2"
  var1   = var.var2
}

