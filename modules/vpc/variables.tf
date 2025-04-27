variable "vpc_cidr" {
    description = "cidr block for vpc"
    default = "10.0.0.0/16"
  
}
variable "public_subnet_1_cidr" {
    description = "CIDR block for first public subnet"
    default = "10.0.1.0/24"
  
}
variable "public_subnet_2_cidr" {
    description = "CIDR block for second public subnet"
    default = "10.0.2.0/24"
  
}
variable "private_subnet_1_cidr" {
    description = "CIDR block for first private subnet"
    default = "10.0.3.0/24"
  
}
variable "private_subnet_2_cidr" {
    description = "CIDR block for second private subnet"
    default = "10.0.4.0/24"
  
}
variable "availability_zone_1" {
    description = "availability zone for public subnet 1"
    default = "us-east-1a"
  
}
variable "availability_zone_2" {
    description = "availability zone for public subnet 2"
    default = "us-east-1b"
  
}