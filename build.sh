#!/bin/bash

# CRITICAL: Configure Git to use HTTPS for GitHub URLs (prevents SSH fallback)
# This is essential for Netlify builds which don't have SSH keys
git config url.https://github.com/.insteadOf git@github.com:
git config url.https://github.com/.insteadOf ssh://git@github.com/

# Sync submodule URLs from .gitmodules to ensure HTTPS URLs are used
git submodule sync --recursive

# Initialize submodules with HTTPS URLs
git submodule update --init --recursive 


# Build the Hugo site with optimization
echo "Running Hugo build with minification..."
hugo --gc --minify

echo "✅ Build completed successfully!"
