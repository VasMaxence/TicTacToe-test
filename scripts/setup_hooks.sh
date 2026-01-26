#!/bin/bash

# Setup script for local git hooks
# Run this once after cloning the repo

HOOKS_DIR=".git/hooks"
SCRIPTS_DIR="scripts/git"

if [ ! -d ".git" ]; then
  echo "❌ Error: This script must be run from the root of the git repository."
  exit 1
fi

echo "🔧 Installing git hooks..."

# Pre-push
if [ -f "$SCRIPTS_DIR/pre-push" ]; then
  cp "$SCRIPTS_DIR/pre-push" "$HOOKS_DIR/pre-push"
  chmod +x "$HOOKS_DIR/pre-push"
  echo "✅ Installed pre-push hook"
else
  echo "⚠️ Warning: scripts/git/pre-push not found"
fi

echo "------------------------------------------------"
echo "🚀 Git hooks setup complete!"
echo "------------------------------------------------"
