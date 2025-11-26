#!/bin/bash
# 🌿 GENESIS Theme Applier
# This script unifies all HTML pages with genesis-theme.css and cleans old inline styles.

echo "🌱 Applying GENESIS Theme to all HTML files..."

# Loop through all HTML files in the current directory and subfolders
for file in $(find . -type f -name "*.html"); do
  echo "🧩 Processing: $file"

  # Check if link to genesis-theme.css exists
  if ! grep -q "genesis-theme.css" "$file"; then
    # Insert link right after <head> tag
    sed -i '/<head>/a \
    <link rel="stylesheet" href="css/genesis-theme.css">' "$file"
    echo "✅ Added theme link to: $file"
  fi

  # Remove duplicate <style> blocks that contain global .card, .nav, or :root
  sed -i '/<style>/,/<\/style>/{
    /:root/d;
    /\.card/d;
    /\.nav/d;
    /\.sidebar/d;
    /\.brand/d;
  }' "$file"

done

echo "🌿 GENESIS Theme applied successfully to all pages!"
