provider "aws" {
   profile="terraform"
   region = "ap-southeast-2"
} 
resource "aws_security_group" "allow_tls_http" {
  name        = "allow_tls_http"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${var.aws_vpc}"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "${var.aws_vpc_ingress}"
  }

  tags = {
    owner = "mohamed.ali"
  }
}

resource "aws_instance" "first_instance"{
#    name = "${var.name}"
    user_data = "${file("install_apache.sh")}"
    ami = "ami-0970010f37c4f9c8d"
    instance_type = "t2.micro"
    tags =  {
        owner = "mohamed.ali"
    }
    #security_groups = "${resource.aws_security_group.allow_tls_http.vpc_id}"
}

resource "aws_instance" "second_instance"{
#    name = "${var.name}"
    user_data = "${file("install_apache.sh")}"
    ami = "ami-0970010f37c4f9c8d"
    instance_type = "t2.micro"
    tags =  {
        owner = "mohamed.ali"
    }
    #security_groups = "${resource.aws_security_group.allow_tls_http.vpc_id}"
}