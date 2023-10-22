// IAM 인스턴스 프로파일 지정
resource "aws_iam_instance_profile" "jaewlim-ec2-instance-profile" {
  name = "jaewlim-ec2-instance-profile"
  path = "/"
  role = "jaewlim-iam-role-ec2-instance-bastion"
}
