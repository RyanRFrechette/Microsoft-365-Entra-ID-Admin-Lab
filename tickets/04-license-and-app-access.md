# Ticket 04 - License and App Access

**Status:** Completed
**Priority:** Medium
**Category:** License Management / App Access

## Problem

A user needs access to Microsoft 365 apps, but access depends on having the correct license assigned.

## Environment

- Microsoft 365 Business Premium trial tenant
- Microsoft 365 admin center
- Microsoft Graph PowerShell
- Test user: Alex Morgan
- License SKU: SPB / Microsoft 365 Business Premium

## Checks Performed

- Queried tenant license inventory with Microsoft Graph PowerShell
- Exported license inventory to `reports/license-inventory.csv`
- Confirmed available Business Premium licensing
- Set the user usage location to US
- Assigned a Microsoft 365 Business Premium license to Alex Morgan
- Verified license assignment with PowerShell
- Verified license assignment in the Microsoft 365 admin center
- Removed the license during offboarding
- Verified the user had zero assigned licenses after removal

## Resolution / Work Completed

Assigned a Microsoft 365 Business Premium license to the Alex Morgan test user after confirming license availability. Verified the license assignment in both PowerShell and the Microsoft 365 admin center. Later removed the license during offboarding to simulate reclaiming app access and licensing.

This is a lab support scenario, not a production incident. The workflow mirrors real help desk requests where app access depends on license assignment.

## Verification

- License inventory exported
- Business Premium SKU identified as `SPB`
- UsageLocation set to US
- AssignedLicenses confirmed as 1 after assignment
- License assignment confirmed in the Microsoft 365 admin center
- AssignedLicenses confirmed as 0 after offboarding removal
- Screenshot evidence added to the README

## Related Evidence

- `screenshots/powershell/04-license-inventory-report.png`
- `reports/license-inventory.csv`
- `screenshots/users/03-license-assigned-alex-morgan.png`
- `screenshots/users/04-license-assigned-admin-center.png`
- `screenshots/users/06-license-removed-offboarding.png`

## What This Proves

This ticket demonstrates practical Microsoft 365 license support skills: checking license availability, assigning app access through licensing, verifying the result in PowerShell and the admin center, and reclaiming the license during offboarding.
