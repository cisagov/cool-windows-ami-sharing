output "launch_permissions" {
  description = "The cisagov/ami-launch-permission-tf-module for each AMI to which launch permission is being granted."
  value       = module.ami_launch_permission
}
