resource "aws_instance" "jaewlim-ec2-bastion" {

  // 이름 및 태그
  tags = {
      Name = "jaewlim-ec2-bastion"
  }

  // Amazon Machine Image(AMI)
  ami = "ami-0556fb70e2e8f34b7" //EC2 > AMI Catalog > Amazon Linux 2023 AMI

  // 인스턴스 유형
  instance_type = "t2.micro"

  // 키 페어(로그인)
  key_name = "terraform-keypair-jaewlim"

  //서브넷
  subnet_id = aws_subnet.jaewlim-public-subnet[1].id

  // 가용 영역
  availability_zone = "ap-southeast-1c"

  // 퍼블릭 IP 자동 할당
  associate_public_ip_address = "true"

  // 방화벽(보안 그룹)
  vpc_security_group_ids = [aws_security_group.jaewlim-sg-bastion.id]

  // 스토리지 구성
  root_block_device {

      // 볼륨 용량(GB)
      volume_size = "30"

      // 볼륨 타입
      volume_type = "gp3"
  }

  // IAM 인스턴스 프로필 할당
  iam_instance_profile = aws_iam_instance_profile.jaewlim-ec2-instance-profile.name

}
