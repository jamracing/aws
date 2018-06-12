#!/usr/bin/env bash

DATE=$(date +%Y-%m-%d_%H-%M)

aws ec2 create-image --instance-id <instanceID> --name "$DATE-<instance_description>" --description "A short description of the image" --no-reboot
