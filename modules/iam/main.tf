# 1. Create Role (Trust Policy for EC2)
resource "aws_iam_role" "ec2_s3_access_role" {
  name = "${var.project_name}-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# 2. Create Policy (Permissions)
resource "aws_iam_policy" "s3_policy" {
  name        = "${var.project_name}-s3-policy"
  description = "Allow Full Access to S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# 3. Attach Policy to Role
resource "aws_iam_role_policy_attachment" "attach_s3" {
  role       = aws_iam_role.ec2_s3_access_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

# 4. Instance Profile (Bridge for EC2) 
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_s3_access_role.name
}