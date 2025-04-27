output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.main_vpc.id
}
output "public_subnet_1_id" {
    description = "Public subnet 1 ID"
    value = aws_subnet.public_subnet_1.id
  
}
output "public_subnet_2_id" {
  description = "ID of the second public subnet"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  description = "ID of the first private subnet"
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  description = "ID of the second private subnet"
  value       = aws_subnet.private_subnet_2.id
}