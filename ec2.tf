# Key Pair
resource "aws_key_pair" "my_instance_key" {
  
  key_name = "${var.env}-key"
  public_key = file("terraform_key.pub")

  tags = {
    Name = "${var.env}-key"
    Environment = var.env
  }
}

# VPC and Security Group

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_security_group" {
    
    name = "${var.env}-security_group"
    description = "This will add the security group."
    vpc_id = aws_default_vpc.default.id

    # inbound rules
    #ssh
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
    }

    # http
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP open"
    }

    # outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All access open for outbound"
    }

    tags = {
      Name = "${var.env}-security_group"
    }

}

# ec2 instance
resource "aws_instance" "my_instance" {

    count = var.instance_count
    depends_on = [ aws_key_pair.my_instance_key,aws_security_group.my_security_group ]
    key_name = aws_key_pair.my_instance_key.key_name
    ami = var.ami
    instance_type = var.instance_type
    security_groups = [aws_security_group.my_security_group.name]
    root_block_device {
        volume_size = var.env == "prod" ? 20 : 10
        volume_type = "gp3"
    }
    tags = {
      Name = "${var.env}-instance"
      Environment = var.env
    }

}
