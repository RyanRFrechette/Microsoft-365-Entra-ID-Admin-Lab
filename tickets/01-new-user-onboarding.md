# Ticket 01 - New User Onboarding

**Status:** Completed
**Priority:** Medium
**Category:** User Lifecycle / Microsoft 365 Administration

## Problem

A new employee needs a Microsoft 365 user account created, basic profile details configured, group-based access assigned, and license access verified.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft 365 admin center
- Microsoft Entra admin center
- Microsoft Graph PowerShell
- Test user: Alex Morgan
- Security group: IT Support Team

## Checks Performed

- Confirmed Microsoft Graph was connected to the correct tenant
- Created the user account with Microsoft Graph PowerShell
- Verified the user account in PowerShell
- Confirmed the user appeared in the Microsoft 365 admin center Active users list
- Added the user to the IT Support Team security group
- Verified group membership with PowerShell and in the Entra admin center
- Assigned a Microsoft 365 Business Premium license
- Verified license assignment with PowerShell and in the Microsoft 365 admin center

## Resolution / Work Completed

Created the Alex Morgan test user account using Microsoft Graph PowerShell, assigned required profile fields, added the user to the IT Support Team security group, and assigned a Microsoft 365 Business Premium license.

This is a lab support scenario, not a production incident. The workflow mirrors a real help desk onboarding request.

## Verification

- User created: `amorgan@RyanFrechetteITLab.onmicrosoft.com`
- Account enabled during onboarding
- Security group membership confirmed
- Microsoft 365 license assignment confirmed
- Active users GUI verification completed
- README includes screenshot evidence for PowerShell and admin center verification

## Related Evidence

- `screenshots/users/01-test-user-created-powershell.png`
- `screenshots/users/02-active-users-list-alex-morgan.png`
- `screenshots/groups/01-security-group-created-alex-added.png`
- `screenshots/groups/02-entra-group-membership-alex-morgan.png`
- `screenshots/users/03-license-assigned-alex-morgan.png`
- `screenshots/users/04-license-assigned-admin-center.png`

## What This Proves

This ticket demonstrates practical Microsoft 365 onboarding skills: creating users, assigning licenses, managing group-based access, verifying changes in both PowerShell and the admin center, and documenting the work in a support-ticket format.
