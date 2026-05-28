# Ticket 05 - MFA and Authentication Methods Review

**Status:** Completed
**Priority:** High
**Category:** Security / Identity Support

## Problem

The tenant needs a basic review of Microsoft Entra authentication methods so support staff understand where MFA and sign-in method settings are managed.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft Entra admin center
- Authentication methods page
- Microsoft Graph PowerShell

## Checks Performed

- Opened the Microsoft Entra admin center
- Navigated to the Authentication methods area
- Reviewed available authentication method policy options
- Confirmed where MFA-related sign-in methods are managed
- Documented the difference between reviewing authentication method settings and enforcing a full Conditional Access policy

## Resolution / Work Completed

Revised the lab security workflow to focus on an honest authentication methods review. The lab demonstrates awareness of where MFA and sign-in method settings live in Microsoft Entra without overclaiming enterprise Conditional Access enforcement.

This is a lab support scenario, not a production incident. The workflow mirrors common help desk and junior cloud support responsibilities: knowing where MFA/authentication method settings are reviewed and how to document security-related account support.

## Verification

- Authentication methods page opened in Microsoft Entra
- Screenshot evidence added to the README
- Password reset and sign-in block/restore workflows were separately tested with Microsoft Graph PowerShell
- No unsupported claim was made that a full enterprise MFA enforcement policy was deployed

## Related Evidence

- `screenshots/security/01-authentication-methods-overview.png`
- `screenshots/users/05-password-reset-force-change.png`
- `screenshots/security/02-block-sign-in-powershell.png`
- `screenshots/security/03-restore-sign-in-powershell.png`

## What This Proves

This ticket demonstrates Microsoft 365 identity-security awareness: reviewing authentication method settings, understanding where MFA-related controls are managed, and documenting security support work without overstating the lab scope.
