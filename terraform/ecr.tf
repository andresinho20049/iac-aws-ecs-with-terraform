resource "aws_ecr_repository" "ecr_repository" {
  name = "ecr-repository-${var.enviroment}"
}