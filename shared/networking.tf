module "vpc" {
 source = "../modules/networking/vpc"
 ...
 ,..

}

module "route53" {
 source = "../modules/networking/vpc"
 ...
 ,..
 
}