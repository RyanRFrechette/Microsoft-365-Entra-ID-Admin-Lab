# Ticket 06 - User Offboarding

**Status:** Completed
**Priority:** High
**Category:** User Lifecycle / Offboarding

## Problem

An employee has left the company and their Microsoft 365 access needs to be removed or suspended.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft 365 admin center
- Microsoft Entra admin center
- Microsoft Graph PowerShell
- Test user: Alex Morgan
- Security group: IT Support Team
- License SKU: SPB / Microsoft 365 Business Premium

## Checks Performed

- Located the Alex Morgan test user with Microsoft Graph PowerShell
- Removed the user from the IT Support Team security group
- Verified the user was no longer a group member
- Removed the Microsoft 365 Business Premium license
- Verified the user had zero assigned licenses
- Blocked user sign-in
- Verified final offboarding state
- Exported a final user audit report to `reports/final-users.csv`

## Resolution / Work Completed

Completed an offboarding workflow for the Alex Morgan test user by removing group-based access, reclaiming the Microsoft 365 Business Premium license, blocking sign-in, and exporting final audit documentation.

This is a lab support scenario, not a production incident. The workflow mirrors common help desk and cloud support offboarding tasks. Session revocation, mailbox export, and account deletion were not performed in this lab.

## Verification

- Removed from IT Support Team group
- StillMember confirmed as False
- AssignedLicenses confirmed as 0
- SignInBlocked confirmed as True
- InITSupportTeam confirmed as False
- Final user report exported
- Screenshot evidence added to the README

## Related Evidence

- `screenshots/groups/03-user-removed-from-security-group.png`
- `screenshots/users/06-license-removed-offboarding.png`
- `screenshots/security/04-final-offboarding-state.png`
- `screenshots/powershell/05-final-user-group-report.png`
- `reports/final-users.csv`

## What This Proves

This ticket demonstrates practical Microsoft 365 offboarding skills: removing group access, reclaiming licensing, blocking sign-in, verifying final account state, and producing audit documentation.
