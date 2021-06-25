provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

resource "aws_instance" "ec2" {
	ami = "ami-0ad704c126371a549"
	instance_type = "t2.micro"
	tags = {
	       Name = "Os by Terraform"
	}
}

resource "aws_ebs_volume" "storage" {
	availability_zone = aws_instance.ec2.availability_zone
	size = 1 
	tags = {
	       Name = "Volume For Os created by terraform"
	}
}

resource "aws_volume_attachment"  "ebs_attach" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.storage.id
	instance_id = aws_instance.ec2.id
}