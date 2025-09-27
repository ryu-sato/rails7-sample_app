#!/bin/bash

# Script to close all Dependabot PRs with "disable auto upgrade" message
# Requires GitHub CLI (gh) to be installed and authenticated

set -e

REPO="ryu-sato/rails7-sample_app"
MESSAGE="disable auto upgrade"

echo "Closing Dependabot PRs in $REPO with message: '$MESSAGE'"

# Get list of open PRs created by dependabot[bot]
DEPENDABOT_PRS=$(gh pr list --repo "$REPO" --author "dependabot[bot]" --state open --json number,title --jq '.[] | "\(.number) \(.title)"')

if [ -z "$DEPENDABOT_PRS" ]; then
    echo "No open Dependabot PRs found."
    exit 0
fi

echo "Found the following Dependabot PRs:"
echo "$DEPENDABOT_PRS"
echo

# Close each PR with the specified message
while IFS= read -r line; do
    if [ -n "$line" ]; then
        pr_number=$(echo "$line" | cut -d' ' -f1)
        pr_title=$(echo "$line" | cut -d' ' -f2-)
        
        echo "Closing PR #$pr_number: $pr_title"
        
        # Add comment and close PR
        gh pr comment "$pr_number" --repo "$REPO" --body "$MESSAGE"
        gh pr close "$pr_number" --repo "$REPO" --comment "$MESSAGE"
        
        echo "✓ Closed PR #$pr_number"
    fi
done <<< "$DEPENDABOT_PRS"

echo
echo "All Dependabot PRs have been closed with message: '$MESSAGE'"