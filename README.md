# 🚀 Terraform GCP IAM Management

This Terraform project manages **Google Cloud IAM roles** for users and service accounts across multiple environments (dev, test, and prd). It automates the assignment of roles and permissions based on configurations provided in a YAML file.

## 📋 Project Structure

The project relies on a `users.yaml` file to define the roles, users, and service accounts. The Terraform code dynamically creates the necessary IAM bindings for each environment.

### 🛠️ Prerequisites

Before running Terraform scripts or deploying via GitHub Actions, ensure the following are configured:

1. **Service Account Key (`SA_KEY`)**:
    - A Google Cloud service account key must be stored as a GitHub secret for each environment (`dev`, `test`, `prd`). This key should have permissions to manage IAM roles.
  
2. **Project ID (`PROJECT_ID`)**:
    - Set an environment variable `PROJECT_ID` for each environment. This identifies the GCP project where roles will be managed.

### 🔑 Secret and Environment Configuration

For each environment (Development, Testing, Production), configure the following:

- **SA_KEY**: Stored as a GitHub secret under each environment.
- **PROJECT_ID**: Set as an environment variable for each environment.

These settings are automatically picked up by the GitHub Actions workflow to deploy Terraform changes.

### 📝 Example `users.yaml`

The role assignments are defined in the `settings/users.yaml` file. This file contains a list of users or service accounts, their types, and the roles assigned to them.

The `users.yaml` follows this structure:

```yaml
users:
  - email: yourmail@example.com
    type: user
    roles:
      - roles/viewer
      - roles/storage.objectAdmin
  - email: anotheremail@gmail.com
    type: user
    roles:
      - roles/viewer