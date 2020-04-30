resource "aws_ssm_parameter" "endpoint" {
  name        = "/ec2/${var.name}/endpoint"
  description = "Endpoint to connect to the ${var.name} ec2 instance"
  type        = "String"
  value       = "${aws_instance.second_instance.public_ip}"
  tags = {
    owner = "mohamed.ali"
  }

}
# ${ssm:/ec2/tst_moh/endpoint~true}