locals {
  len_public_subnets= length(var.public_subnets)
}
resource "aws_vpc" "vpc_eks" {
    cidr_block = "10.0.0.0/16"

    enable_dns_support = true
    enable_dns_hostnames = true


    tags = {
      "name" = var.vpc_name
    }
}

resource "aws_subnet" "public" {
    count = 1
    vpc_id = aws_vpc.vpc_eks.id
    cidr_block = element(concat(var.public_subnets),count.index)
    availability_zone = element(concat(var.azs),count.index)
    
    tags = {
      "name" = try(format("${var.vpc_name}-public-%s",element(var.azs,count.index)))
    }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_eks.id
  
  tags = {
    "Name" = "${var.vpc_name}-public"
  }
}

resource "aws_route_table_association" "public" {
  count = local.len_public_subnets

  route_table_id = aws_route_table.public.id
  subnet_id = element(aws_subnet.public[*].id,count.index)
}