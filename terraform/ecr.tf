resource "aws_ecr_repository" "ecr_repository" {
  name = "ecr_repository_${var.enviroment}"
}