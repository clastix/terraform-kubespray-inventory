terraform-docs_version := v0.16.0
terraform-docs := $(shell command -v terraform-docs 2>/dev/null)

terraform-docs:
	@go install github.com/terraform-docs/terraform-docs@$(terraform-docs_version)

docs: terraform-docs
	@$(terraform-docs) md . > README.md
