# ec2.tf

resource "aws_instance" "ubuntu_instance" {
  ami                    = "ami-0be48b687295f8bd6" # Ubuntu 20.04 AMI ID
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0bf949c0e9b124487" # Hardcoded subnet ID for Ubuntu instance
  key_name               = "tf_test"
  security_groups        = [aws_security_group.ubuntu_sg.id] # Assign Ubuntu security group
  tags = {
    Name = "tf_aa_ec2_ubuntu22"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/ubuntu_userdata.sh", {})
}

