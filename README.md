##### Terraform Skeleton single repo with multiple ENV, `master` branch will be single source of truth
---
# Terraform skeleton structure
`$ tree -L 4`

```yml
.
├── README.md
├── app1
│   ├── alb.tf
│   ├── ec2.tf
│   ├── rds.tf
│   ├── route53.tf
│   ├── s3.tf
│   └── variables.tf
├── app2
│   ├── alb.tf
│   ├── ec2.tf
│   ├── rds.tf
│   ├── route53.tf
│   └── variables.tf
├── environments
│   ├── dev
│   │   ├── app1
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.auto.tfvars
│   │   │   └── variables.tf
│   │   └── app2
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── terraform.auto.tfvars
│   │       └── variables.tf
│   ├── production
│   │   ├── app1
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.auto.tfvars
│   │   │   └── variables.tf
│   │   └── app2
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       ├── terraform.auto.tfvars
│   │       └── variables.tf
│   └── staging
│       ├── app1
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── terraform.auto.tfvars
│       │   └── variables.tf
│       └── app2
│           ├── main.tf
│           ├── outputs.tf
│           ├── terraform.auto.tfvars
│           └── variables.tf
├── live_resource.tf
├── modules
│   ├── compute
│   │   ├── ec2
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── lambda
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── datastore
│   │   ├── efs
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── rds
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── s3
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── networking
│       ├── route53
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       └── vpc
│           ├── internet_gateway.tf
│           ├── main.tf
│           ├── nat_gateway.tf
│           ├── outputs.tf
│           ├── subnet.tf
│           ├── variables.tf
│           └── vpc.tf
├── outputs.tf
├── shared
│   ├── ec2.tf
│   ├── networking.tf
│   ├── route53.tf
│   ├── s3.tf
│   └── variables.tf
├── terraform.auto.tfvars
└── variables.tf
```
# Install terraformer
```bash
export PROVIDER=aws\
export PROVIDER_VERSION=3.48.0\
export OS=darwin\
```

```bash
curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-${OS}-amd64
chmod +x terraformer-${PROVIDER}-${OS}-amd64
sudo mv terraformer-${PROVIDER}-${OS}-amd64 /usr/local/bin/terraformer
```
# Install AWS provider
```bash
mkdir -p ~/.terraform.d/plugins/${OS}_amd64
curl -L https://releases.hashicorp.com/terraform-provider-aws/${PROVIDER_VERSION}/terraform-provider-aws_${PROVIDER_VERSION}_${OS}_amd64.zip -o terraform-provider-aws.zip
unzip terraform-provider-aws.zip
mv terraform-provider-aws_v${PROVIDER_VERSION}* ~/.terraform.d/plugins/${OS}_amd64/ 
```
