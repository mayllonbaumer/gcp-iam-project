# Terraform GCP Identity and Groups Management

## Introduction

This project uses **Terraform** to automate the management of **Google Cloud Identity** groups, users, permissions, and custom roles. It assumes that **Cloud Identity** has already been set up in your GCP environment, allowing you to create and manage groups, assign users, and apply project-level permissions.

## Features
- Create Cloud Identity groups.
- Manage group memberships.
- Assign IAM roles to groups.
- Create and manage custom roles.
- Automatically provision via CI/CD pipeline using GitHub Actions.

---

## How to Use

### Prerequisites

Before using this Terraform module, you need to have the following:

1. A GCP project where **Cloud Identity** or **Google Workspace** is set up.
2. A **service account** with the following roles:
   - `Cloud Identity Groups Admin` (`roles/cloudidentity.groups.admin`)
   - `Project Editor` (`roles/editor`)
3. **Cloud Identity API** must be enabled in the project.