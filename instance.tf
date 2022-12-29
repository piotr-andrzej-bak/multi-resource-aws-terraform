resource "aws_key_pair" "terra-key" {
  key_name   = "terra-key"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "terra-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.terra-pub-1.id
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = [aws_security_group.terra_stack_sg.id]
  tags = {
    Name = "terra-web"
  }
}

resource "aws_ebs_volume" "vol_4_terra" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-terra"
  }
}

resource "aws_volume_attachment" "atch_vol_terra" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_terra.id
  instance_id = aws_instance.terra-web.id
}

output "PublicIP" {
  value = aws_instance.terra-web.public_ip
}
