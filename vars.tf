variable "vpc_name" {
    description = "vpc name"
    type = string
}
variable "public_subnets" {
    description = "list public subnets"
    type = list(string)
    default = ["10.0.64.0/19","10.0.96.0/19"]
}
variable "azs" {
    description = "list availability zone"
    type = list(string)
    default = ["ap-southeast-1a","ap-southeast-1b"]
}