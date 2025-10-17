#!/bin/bash
# Script to create symlinks for Factory droid system files
# Usage: create-factory-symlinks

set -e

# Define the source->target mappings
# Format: "source_path:target_name"
LINKS=(
    "/Users/besi/.codex/AGENTS.md:AGENTS.md"
    "/Users/besi/.factory/droids:droids"
    "/Users/besi/.factory/orchestrator:orchestrator"
    "/Users/besi/.factory/scripts:scripts"
)

# Get current working directory
TARGET_DIR="$(pwd)"

echo "🔗 Creating symlinks in: $TARGET_DIR"
echo "=================================="

# Check if sources exist
echo "📋 Checking source files..."
valid_links=()
for link in "${LINKS[@]}"; do
    source="${link%%:*}"
    target="${link##*:}"
    
    if [[ -e "$source" ]]; then
        echo "✅ Found: $source"
        valid_links+=("$link")
    else
        echo "❌ Missing: $source"
        echo "⚠️  Skipping symlink creation for missing source"
    fi
done

echo ""
echo "🔗 Creating symlinks..."

# Create symlinks
success_count=0
for link in "${valid_links[@]}"; do
    source="${link%%:*}"
    target_name="${link##*:}"
    target_path="$TARGET_DIR/$target_name"
    
    # Remove existing symlink or file/directory with same name
    if [[ -e "$target_path" ]] || [[ -L "$target_path" ]]; then
        echo "🗑️  Removing existing: $target_name"
        rm -rf "$target_path"
    fi
    
    # Create the symlink
    echo "🔗 Linking: $target_name -> $source"
    ln -s "$source" "$target_path"
    
    # Verify the symlink was created successfully
    if [[ -L "$target_path" ]]; then
        echo "✅ Created: $target_name"
        ((success_count++))
    else
        echo "❌ Failed to create: $target_name"
    fi
done

echo ""
echo "🎉 Symlink creation complete!"
echo "📁 Created $success_count symlinks in $TARGET_DIR"

# List created symlinks
echo ""
echo "📋 Created symlinks:"
for link in "${valid_links[@]}"; do
    source="${link%%:*}"
    target_name="${link##*:}"
    target_path="$TARGET_DIR/$target_name"
    
    if [[ -L "$target_path" ]]; then
        echo "   $target_name -> $source"
    fi
done
