# Start/Stop AWS WorkSpaces using SSM Automation

## Purpose
This runbook describes the procedure for starting or stopping AWS WorkSpaces using AWS Systems Manager (SSM) Automation.

## Prerequisites
- AWS WorkSpaces must be configured and running.
- AWS Systems Manager Automation permissions must be set up for your user or role.

## Steps

### 1. Start WorkSpace
Use the AWS SSM Automation runbook to start a WorkSpace. Replace `<WorkSpaceId>` with the actual WorkSpace ID.

- Open the **AWS Management Console** and go to **Systems Manager**.
- Navigate to **Automation** under **Action** 
- Search for **AWS-Start-WorkSpace** and select it.
- Click **Execute**.
- Provide the **WorkSpaceId** (e.g., `ws-12345678`).
- Click **Execute** again to start the WorkSpace.

Alternatively, you can use AWS CLI:
```bash
aws ssm start-automation-execution --document-name "AWS-Start-WorkSpace" --parameters WorkSpaceId=<WorkSpaceId>
