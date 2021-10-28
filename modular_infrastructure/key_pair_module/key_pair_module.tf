# Defining variables this module requires
variable "set_key_pair_name" {}

# Create a key pair 
resource "aws_key_pair" "key_pair" {
  key_name   = var.set_key_pair_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAiHxlZP1Y9VBz0Dk8LDiVeey2yH1nRYw6mzwZVP7LwY0zlKlqIBpH+4tQQKmAQl99V+6BaRxkRd7UhmObDktKjrCylJxtdY3zya7/1/2flkexWceTHXHerX0/OpSTiGNWu9F/Pqulwcj6tTA3puYcQwvAS78+iEoNVY0mTVleDS9kCWJ7+bIZ6GQ936WH4HZeyAhvGY6v1VgKUmz/3b4mvv4Q4D7Rc6nsElPScgbNqjvI2QXbN9kFYbxhCr2/LIKXgHLBdG3QtdA/dc0xLIMZQ6+RyvREMx4zA8Ryja8kONifr4nJlxVwrmQWIXEQKGfbcT1p4f3d+SgwqluREUn+4w== rsa-key-20210925"
}

output "key_name_output" {
  value = aws_key_pair.key_pair.key_name
}
