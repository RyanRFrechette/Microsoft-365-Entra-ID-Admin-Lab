# Case Study: Microsoft 365 / Entra ID Admin Lab

**Status:** Completed technical lab with documentation polish in progress

## Project Overview

This project is a Microsoft 365 and Microsoft Entra ID administration lab designed for help desk, IT support, cloud support, and junior Microsoft 365 admin roles.

The lab demonstrates practical user support workflows using both the Microsoft 365 admin center and Microsoft Graph PowerShell.

## Business Problem

A small organization needs IT support coverage for common Microsoft 365 tasks: creating users, assigning licenses, managing security group access, resetting passwords, reviewing authentication method settings, blocking or restoring sign-in, offboarding users, and documenting support work clearly.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft 365 admin center
- Microsoft Entra admin center
- Microsoft Graph PowerShell
- PowerShell 5.1 on Windows
- GitHub for version control and portfolio documentation
- ShareX for screenshot evidence

## What I Built

- A public GitHub portfolio repo designed for HR and technical hiring managers
- A screenshot-based README walkthrough
- Six completed support-ticket documents
- PowerShell-based Microsoft Graph admin workflows
- Exported CSV reports for baseline users, license inventory, and final user audit
- A streamlined screenshot helper that saves screenshots, updates the README, commits, and pushes proof in one workflow

## Admin Work Completed

- Confirmed Microsoft 365 admin center access
- Confirmed Microsoft Entra admin center access
- Installed Microsoft Graph PowerShell modules
- Connected to Microsoft Graph with delegated admin scopes
- Exported a baseline user report
- Created a test user named Alex Morgan
- Verified the user in PowerShell and the Microsoft 365 admin center
- Created a security group named IT Support Team
- Added the user to the security group
- Verified group membership in PowerShell and the Entra admin center
- Queried tenant license inventory
- Assigned a Microsoft 365 Business Premium license
- Verified license assignment in PowerShell and the Microsoft 365 admin center
- Reset a user password and forced password change at next sign-in
- Reviewed the Entra Authentication methods area
- Blocked and restored user sign-in
- Completed offboarding by removing group membership, removing the license, blocking sign-in, and exporting final audit evidence

## PowerShell Automation

Microsoft Graph PowerShell was used for repeatable admin tasks including user creation, user updates, group creation, group membership changes, license assignment, license removal, sign-in blocking, sign-in restoration, and report exports.

This shows the ability to work beyond the GUI and use PowerShell for faster, repeatable Microsoft 365 administration.

## Support Tickets Completed

- Ticket 01 - New User Onboarding
- Ticket 02 - Password Reset and Sign-In Support
- Ticket 03 - Group Access Request
- Ticket 04 - License and App Access
- Ticket 05 - MFA and Authentication Methods Review
- Ticket 06 - User Offboarding

## Evidence and Screenshots

The README displays proof screenshots for setup, Microsoft Graph, user lifecycle management, group access, licensing, password reset, authentication methods, sign-in blocking/restoration, offboarding, and final reporting.

Key report files:

- `reports/baseline-users.csv`
- `reports/license-inventory.csv`
- `reports/final-users.csv`

## Important Scope Note

This lab does not claim to deploy enterprise Conditional Access policy, revoke active sessions, perform mailbox export, configure Intune device management, or complete advanced security engineering.

The MFA/security section is intentionally scoped as an authentication methods review and identity-support awareness exercise.

## What I Learned

- How Microsoft 365 and Entra ID split admin responsibilities between productivity, identity, users, groups, licensing, and security settings
- How to use Microsoft Graph PowerShell for common support workflows
- How to verify changes in both PowerShell and the admin center
- How to document help desk work in a ticket-style format
- How to avoid overclaiming by documenting exactly what was performed and what was not performed

## Role Relevance

This project maps directly to entry-level and junior Microsoft cloud support work. It demonstrates the ability to support users, troubleshoot account access, manage licenses, handle group-based access requests, perform basic security reviews, complete offboarding steps, and document the work clearly for a support environment.

## Final Outcome

The lab proves practical Microsoft 365 and Entra ID administration skills using a clean public portfolio repo with screenshots, support tickets, reports, and a hiring-manager-friendly README.
