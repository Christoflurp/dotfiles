#!/bin/bash

# Define an array of repositories
repos=("shopify" "shipify" "bloodhound" "shop-server" "evs-shipping" "web")

# Initialize an empty variable to hold the combined results
combined_results=""

# Iterate over each repository and run the command
for repo in "${repos[@]}"; do
  results=$(gh pr list --repo "Shopify/$repo" --author @me --state merged --limit 1000 --json title,body,mergedAt --search "merged:>2024-03-01")
  combined_results="$combined_results$results"
done

# Copy the combined results to the clipboard
echo "$combined_results" | pbcopy
