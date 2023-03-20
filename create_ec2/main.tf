data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my_ec2_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.ec2_type
  key_name = var.ec2_pem
   vpc_security_group_ids = [var.ec2_sg_id]
  tags = {
        Name = "Terraform"
  }
}
