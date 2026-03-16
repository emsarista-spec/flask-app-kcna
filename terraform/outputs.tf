output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.ec2.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.ec2.public_dns
}

output "instance_state" {
  description = "Current state of the EC2 instance"
  value       = aws_instance.ec2.instance_state
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i local-keypair.pem ubuntu@${aws_instance.ec2.public_ip}"
}

output "user_data_log_command" {
  description = "Command to view cloud-init logs (run after SSHing in)"
  value       = "sudo cat /var/log/cloud-init-output.log"
}