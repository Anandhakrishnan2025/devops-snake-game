output "cluster_id" {
  value = aws_eks_cluster.anand-eks-cluster.id
}
 
output "node_group_id" {
  value = aws_eks_node_group.anand.id
}
 
output "vpc_id" {
  value = aws_vpc.anand_eks_vpc.id
}
 
output "subnet_id" {
  value = aws_subnet.anand_eks_subnet[*].id
}