resource "aws_launch_configuration" "web_server_as" {
    image_id           = "ami-00b8917ae86a424c9"
    instance_type = "t2.micro"
    key_name = "monolythic"
}
   

resource "aws_autoscaling_group" "web_server_asg" {
    name                 = "web-server-asg"
    launch_configuration = aws_launch_configuration.web_server_as.name
    min_size             = 1
    max_size             = 3
    desired_capacity     = 2
    health_check_type    = "EC2"
    availability_zones    = ["us-east-1a", "us-east-1b"] 
    
  }

