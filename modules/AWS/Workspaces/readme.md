

Modules (Workspaces/):

workspaces/  Creates AWS WorkSpaces dynamically.
users/ Retrieves user information from IAM, AWS SSO, or AD.

=============================================================================

Environment-Specific Configurations (environments/):

dev/ and prod/ have their own Terraform configurations.

==============================================================================

Global Configurations:

backend.tf → Remote state storage.
providers.tf → AWS provider setup.

===============================================================

Scripts (scripts/):

Contains automation scripts for AWS WorkSpaces management.

ssm-runbook.yaml	AWS Systems Manager (SSM) runbook to automate specific tasks (e.g., patching, updates).
patching-automation.sh	A shell script for automating WorkSpaces patching processes.


===========================================================

Documentation (docs/):

Stores documentation on setting up and managing WorkSpaces.

automate-workspace-creation.md	Documents the process of setting up WorkSpaces using Terraform, including prerequisites, setup instructions, and troubleshooting steps.
