lint:
	terraform fmt --recursive

validate:
	terraform init
	terraform validate

docs:
	terraform-docs .
	terraform-docs -c .terraform-docs.yml ./ec2-static-alarms
