# Dependabot Management

This document explains how to manage Dependabot automatic updates for this repository.

## Current Status

As of this implementation, automatic dependency updates have been disabled to prevent unwanted automatic upgrades.

## Files Created

### 1. `.github/dependabot.yml`
Configures Dependabot to disable automatic updates by setting `open-pull-requests-limit: 0` for both:
- Ruby gem dependencies (bundler)
- GitHub Actions dependencies

### 2. `.github/workflows/close-dependabot-prs.yml`
GitHub Actions workflow that can be manually triggered to close all open Dependabot PRs with a custom message.

**Usage:**
1. Go to Actions tab in GitHub
2. Select "Close Dependabot PRs" workflow
3. Click "Run workflow"
4. Enter reason (default: "disable auto upgrade")

### 3. `scripts/close_dependabot_prs.sh`
Bash script for closing Dependabot PRs using GitHub CLI.

**Prerequisites:**
- GitHub CLI (`gh`) installed
- Authenticated with appropriate permissions

**Usage:**
```bash
./scripts/close_dependabot_prs.sh
```

## Dependabot PRs Identified for Closure

The following open PRs were created by Dependabot and should be closed with the message "disable auto upgrade":

1. PR #22: Bump turbo-rails from 2.0.13 to 2.0.17
2. PR #21: Bump puma from 6.6.0 to 7.0.4
3. PR #16: Bump pg from 1.5.9 to 1.6.2
4. PR #15: Bump rails from 7.2.2.1 to 7.2.2.2
5. PR #14: Bump jbuilder from 2.13.0 to 2.14.1
6. PR #13: Bump json-schema from 5.1.1 to 5.2.2
7. PR #12: Bump actions/checkout from 4 to 5
8. PR #8: Bump importmap-rails from 2.1.0 to 2.2.2
9. PR #4: Bump brakeman from 7.0.2 to 7.1.0
10. PR #2: Bump debug from 1.10.0 to 1.11.0

## Manual Dependency Management

With automatic updates disabled, dependencies should be updated manually when needed:

1. Review dependency updates periodically
2. Test updates in a development environment
3. Create manual PRs for important security updates
4. Use `bundle update` for Ruby gems
5. Update GitHub Actions versions as needed

## Re-enabling Dependabot (if needed)

To re-enable automatic updates in the future:

1. Modify `.github/dependabot.yml`:
   - Change `open-pull-requests-limit: 0` to a positive number (e.g., `5`)
   - Or remove the line entirely to use default settings

2. Dependabot will resume creating PRs according to the schedule