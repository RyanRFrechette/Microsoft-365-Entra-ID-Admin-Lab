# Screenshot Workflow

## Setup (one time)

```powershell
# From the repo root
.\scripts\Install-LabShotAlias.ps1
. $PROFILE   # reload shell
```

## Per-screenshot workflow

**Step 1 — Take the screenshot**
Use ShareX. It saves automatically to your configured folder.

**Step 2 — Run labshot**

```powershell
labshot <area> <name> "<commit message>"
```

`<area>` must be one of: `setup` `users` `groups` `security` `powershell` `tickets`

Examples:
```powershell
labshot setup  01-admin-center-home      "docs: add M365 admin center home screenshot"
labshot users  02-new-user-profile       "docs: add new user profile screenshot"
labshot tickets ticket-01-user-created   "docs: add onboarding ticket screenshot"
```

The script will:
1. Find the newest `.png/.jpg/.jpeg` on your PC (outside the repo)
2. Copy it to `screenshots/<area>/<name>.png`
3. `git add` → `git commit` → `git push origin master`
4. Print source path, destination path, commit result, push result, and `git status`

**Stage only, no commit:**
```powershell
labshot setup 01-overview "docs: wip" -NoCommit
```

## A screenshot is not complete until

- [ ] Committed with a meaningful message
- [ ] Pushed and visible at `github.com/<repo>/tree/master/screenshots/<area>/`
- [ ] Rendered in README or the relevant ticket file

## Screenshot checklist

See [`screenshot-checklist.md`](../screenshot-checklist.md) for the full list of required captures.
