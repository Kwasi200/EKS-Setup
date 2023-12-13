module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  #version = "2.64.0"
  version = "5.2.0"

  name = "vpc-module-demo"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  #enable_nat_gateway = true
  enable_vpn_gateway = false
  # The code below had to be added so deployment won't be interrupted.  
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.cluster-name}-vpc"
  }
}