# Automate Workspace Creation

This runbook automates the creation of AWS WorkSpaces for users. 

### Prerequisites:
1. An AWS directory has been set up.
2. IAM users are already created in AWS IAM.
3. Terraform is configured to interact with AWS.

### Steps:
1. Set the `selected_user` variable to the user for whom you wish to create the WorkSpace.
2. Use the `aws_workspaces_workspace` resource to create the WorkSpace for the selected user.
3. Ensure that the bundle ID and directory ID are correctly specified in the environment files (`dev/main.tf` or `prod/main.tf`).

### Example Workflow:
- For the dev environment, the user `user1` will be selected.
- In the prod environment, `user2` will be selected.

Follow the steps in the documentation to create and manage WorkSpaces efficiently.
