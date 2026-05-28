# Ticket 02 - Password Reset and Sign-In Support

**Status:** Completed
**Priority:** High
**Category:** Authentication / Account Support

## Problem

A user cannot sign in and needs help desk support to reset their password, require a password change at next sign-in, and confirm account access can be blocked or restored when needed.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft Entra admin center
- Microsoft Graph PowerShell
- Test user: Alex Morgan
- User principal name: amorgan@RyanFrechetteITLab.onmicrosoft.com

## Checks Performed

- Located the Alex Morgan test user with Microsoft Graph PowerShell
- Reset the user password using Microsoft Graph PowerShell
- Required password change at next sign-in
- Blocked sign-in to simulate suspended access
- Verified the account showed AccountEnabled = False
- Restored sign-in access
- Verified the account showed AccountEnabled = True

## Resolution / Work Completed

Reset the Alex Morgan test user password and required the user to change the password at next sign-in. Then tested the sign-in support workflow by blocking sign-in and restoring sign-in with Microsoft Graph PowerShell.

This is a lab support scenario, not a production incident. The workflow mirrors common help desk requests for password reset, account lockout, and access restoration.

## Verification

- Password reset action documented
- ForceChangeAtNextSignIn confirmed as True
- Blocked sign-in verified with AccountEnabled = False
- Restored sign-in verified with AccountEnabled = True
- Screenshot evidence added to the README

## Related Evidence

- `screenshots/users/05-password-reset-force-change.png`
- `screenshots/security/02-block-sign-in-powershell.png`
- `screenshots/security/03-restore-sign-in-powershell.png`

## What This Proves

This ticket demonstrates practical Microsoft 365 help desk skills: password reset, forced password change, account access suspension, access restoration, and clear support documentation.
