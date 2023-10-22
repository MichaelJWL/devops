resource "aws_route_table" "jaewlim-route-table-pub-sub" {

  // 프로비저닝 전 VPC 및 Internet Gateway 생성
  depends_on = [
    aws_vpc.jaewlim-vpc,
    aws_internet_gateway.jaewlim-internet-gateway
  ]

  // 라우팅 테이블 설정 이름 및 태그 생성
  tags = {
    Name = "jaewlim-route-table-pub-sub"
  }

  // VPC 선택
  vpc_id = aws_vpc.jaewlim-vpc.id

  // 라우팅 룰 적용 - Internet Gateway(인터넷 연결)
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.jaewlim-internet-gateway.id
  }

}
