# Ticket 03 - Group Access Request

**Status:** Completed
**Priority:** Medium
**Category:** Access Management / Group Membership

## Problem

A user needs access to a shared resource or team workspace that is controlled through security group membership.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft Entra admin center
- Microsoft Graph PowerShell
- Test user: Alex Morgan
- Security group: IT Support Team

## Checks Performed

- Created the IT Support Team security group with Microsoft Graph PowerShell
- Located the Alex Morgan test user
- Added Alex Morgan to the IT Support Team security group
- Verified group membership with Microsoft Graph PowerShell
- Verified group membership in the Microsoft Entra admin center
- Later removed Alex Morgan from the group as part of the offboarding workflow
- Verified the user was no longer a group member

## Resolution / Work Completed

Added the Alex Morgan test user to the IT Support Team security group to simulate a common access request. Verified the membership in both PowerShell and the Entra admin center. During offboarding, removed the user from the same group and verified membership was removed.

This is a lab support scenario, not a production incident. The workflow mirrors real help desk access requests where group membership controls user access.

## Verification

- Security group created: IT Support Team
- User added to group successfully
- PowerShell membership check confirmed Alex Morgan as a member
- Entra admin center membership view confirmed Alex Morgan as a member
- Offboarding removal confirmed StillMember = False
- Screenshot evidence added to the README

## Related Evidence

- `screenshots/groups/01-security-group-created-alex-added.png`
- `screenshots/groups/02-entra-group-membership-alex-morgan.png`
- `screenshots/groups/03-user-removed-from-security-group.png`

## What This Proves

This ticket demonstrates practical Microsoft 365 and Entra ID access-management skills: creating security groups, adding users to groups, verifying access in both PowerShell and the admin center, and removing access during offboarding.
