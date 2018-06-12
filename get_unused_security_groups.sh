#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    echo "requires profile name as only arg"
fi
comm -23  <(aws ec2 --profile $1 describe-security-groups --query 'SecurityGroups[*].GroupId'  --output text | tr '\t' '\n'| sort) <(aws ec2 --profile $1 describe-instances --query 'Reservations[*].Instances[*].SecurityGroups[*].GroupId' --output text | tr '\t' '\n' | sort | uniq)
