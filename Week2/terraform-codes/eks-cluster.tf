resource "aws_eks_cluster" "jaewlim-eks-cluster" {

    // 프로비저닝 전 IAM Role 생성 필요
    depends_on = [
        aws_iam_role_policy_attachment.jaewlim-eks_iam_cluster_AmazonEKSClusterPolicy
    ]

    // 이름
    name = var.cluster-name

    // Kubernetes 버전
    version = "1.28"

    // 클러스터 서비스 역할
    role_arn = aws_iam_role.jaewlim-eks_iam_cluster.arn

    // 네트워킹
    vpc_config{

        // 서브넷
        subnet_ids = flatten([aws_subnet.jaewlim-public-subnet[*].id])

        // 보안그룹
        security_group_ids = [aws_security_group.jaewlim-eks_sg_controlplane.id, aws_security_group.jaewlim-eks_sg_nodes.id]

        // 클러스터 엔드포인트 액세스
        endpoint_public_access = true
    }

    tags = {
        "Name" = "jaewlim-EKS-CLUSTER"
    }
}
