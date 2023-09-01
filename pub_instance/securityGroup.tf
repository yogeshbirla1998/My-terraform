resource "aws_security_group" "security_sg_pub" {
    name        = var.security_sg_pub_name
    description = "Allow HTTPS to web server"  #data.terraform_remote_state.vpc.outputs.default_security_group_id
    vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

    ingress {
        description = "HTTPS ingress"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
   }
}
