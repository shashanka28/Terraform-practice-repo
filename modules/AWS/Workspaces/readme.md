Modules (Workspaces/):

workspaces/ → Creates AWS WorkSpaces dynamically.
users/ → Retrieves user information from IAM, AWS SSO, or AD.
Environment-Specific Configurations (environments/):

dev/ and prod/ have their own Terraform configurations.
Global Configurations:

backend.tf → Remote state storage.
providers.tf → AWS provider setup.
Scripts (scripts/):

Contains automation scripts for AWS WorkSpaces management.
Documentation (docs/):

Stores documentation on setting up and managing WorkSpaces.