#!/usr/bin/env bash
set -e
export AWS_DEFAULT_REGION="eu-west-3"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
user_data=$(cat "$SCRIPT_DIR/user-data.sh")
# Create a security group
security_group_id=$(aws ec2 create-security-group \
--group-name "td2-sample-app" \
--description "Allow HTTP traffic into the sample app" \
--output text \
--query GroupId)
# Allow inbound HTTP traffic
aws ec2 authorize-security-group-ingress \
--group-id "$security_group_id" \
--protocol tcp \
--port 80 \
--cidr "0.0.0.0/0" > /dev/null
# Get the latest Amazon Linux 2023 AMI ID
ami_id=$(aws ec2 describe-images \
    --owners amazon \
    --filters "Name=name,Values=al2023-ami-2023*-x86_64" \
    --query "sort_by(Images, &CreationDate)[-1].ImageId" \
    --output text)
# Launch the EC2 instance
instance_id=$(aws ec2 run-instances \
--image-id "$ami_id" \
--instance-type "t3.micro" \
--security-group-ids "$security_group_id" \
--user-data "$user_data" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=td2-sample-app}]' \
--output text \
--query Instances[0].InstanceId)
# Wait for the instance to be in running state
aws ec2 wait instance-running --instance-ids "$instance_id"
# Get the public IP address
public_ip=$(aws ec2 describe-instances \
--instance-ids "$instance_id" \
--output text \
--query 'Reservations[*].Instances[*].PublicIpAddress')
echo "Instance ID = $instance_id"
echo "Security Group ID = $security_group_id"
echo "Public IP = $public_ip"