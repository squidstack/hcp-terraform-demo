# HCP Terraform Demo

Demo repository showcasing CloudBees Unify integration with HCP Terraform.

## Overview

This repository demonstrates how to use the `guru-actions/hcp-terraform` action to execute Terraform operations through HCP Terraform within CloudBees workflows.

## Repository Structure

```
hcp-terraform-demo/
├── .cloudbees/
│   └── workflows/
│       └── hcp-terraform-run.yaml    # CloudBees workflow
├── terraform/
│   ├── main.tf                       # Main Terraform configuration
│   ├── variables.tf                  # Variable definitions
│   └── outputs.tf                    # Output definitions
├── envs/
│   ├── dev.tfvars                    # Dev environment variables
│   └── prod.tfvars                   # Prod environment variables
└── README.md
```

## Workflow

The workflow `.cloudbees/workflows/hcp-terraform-run.yaml`:
- Accepts `environment` and `operation` inputs
- Calls `guru-actions/hcp-terraform@v0.1` in stub mode
- Displays run results
- Publishes evidence to CloudBees

### Inputs

- **environment**: `dev` or `prod`
- **operation**: `plan`, `apply`, or `drift`

### Outputs

- Run ID
- Run URL
- Status
- Summary JSON

## Terraform Code

The Terraform configuration is safe and provider-neutral:
- Uses only `null_resource` (no cloud providers)
- Defines environment variable
- Returns environment name as output
- No remote backend configured

## Usage

1. Trigger the workflow via CloudBees UI or API
2. Select environment (dev/prod)
3. Select operation (plan/apply/drift)
4. View results and evidence

## Current Status

**Phase 1: Stub Implementation**

The action currently runs in stub mode, generating realistic mock data without executing actual Terraform operations or connecting to HCP Terraform.

## Future Phases

- Phase 2: Implement live HCP Terraform API integration
- Phase 3: Add authentication and workspace management
- Phase 4: Integrate with CloudBees compliance and governance features
