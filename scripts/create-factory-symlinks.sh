#!/bin/bash
# Script to setup Factory droid system files
# Usage: create-factory-symlinks
# 
# Creates symlinks for AGENTS.md and scripts/
# Copies droids/ and orchestrator/ directories

set -e

# Define the source->target mappings for symlinks
# Format: "source_path:target_name"
SYMLINKS=(
    "/Users/besi/.codex/AGENTS.md:AGENTS.md"
    "/Users/besi/.factory/scripts:scripts"
)

# Define the source->target mappings for copies
# Format: "source_path:target_name"
COPIES=(
    "/Users/besi/.factory/droids:droids"
    "/Users/besi/.factory/orchestrator:orchestrator"
)

# Get current working directory
TARGET_DIR="$(pwd)"

echo "🚀 Setting up Factory system in: $TARGET_DIR"
echo "================================================"

# Check if sources exist for symlinks
echo "📋 Checking source files for symlinks..."
valid_symlinks=()
for link in "${SYMLINKS[@]}"; do
    source="${link%%:*}"
    target="${link##*:}"
    
    if [[ -e "$source" ]]; then
        echo "✅ Found: $source"
        valid_symlinks+=("$link")
    else
        echo "❌ Missing: $source"
        echo "⚠️  Skipping symlink creation for missing source"
    fi
done

# Check if sources exist for copies
echo ""
echo "📋 Checking source directories for copying..."
valid_copies=()
for copy in "${COPIES[@]}"; do
    source="${copy%%:*}"
    target="${copy##*:}"
    
    if [[ -e "$source" ]]; then
        echo "✅ Found: $source"
        valid_copies+=("$copy")
    else
        echo "❌ Missing: $source"
        echo "⚠️  Skipping copy for missing source"
    fi
done

echo ""
echo "🔗 Creating symlinks..."

# Create symlinks
symlink_count=0
for link in "${valid_symlinks[@]}"; do
    source="${link%%:*}"
    target_name="${link##*:}"
    target_path="$TARGET_DIR/$target_name"
    
    # Remove existing symlink or file with same name
    if [[ -e "$target_path" ]] || [[ -L "$target_path" ]]; then
        echo "🗑️  Removing existing: $target_name"
        rm -rf "$target_path"
    fi
    
    # Create the symlink
    echo "🔗 Linking: $target_name -> $source"
    ln -s "$source" "$target_path"
    
    # Verify the symlink was created successfully
    if [[ -L "$target_path" ]]; then
        echo "✅ Created symlink: $target_name"
        ((symlink_count++))
    else
        echo "❌ Failed to create symlink: $target_name"
    fi
done

echo ""
echo "📦 Copying directories..."

# Copy directories
copy_count=0
for copy in "${valid_copies[@]}"; do
    source="${copy%%:*}"
    target_name="${copy##*:}"
    target_path="$TARGET_DIR/$target_name"
    
    # Remove existing directory with same name
    if [[ -e "$target_path" ]]; then
        echo "🗑️  Removing existing: $target_name"
        rm -rf "$target_path"
    fi
    
    # Copy the directory
    echo "📦 Copying: $target_name"
    cp -r "$source" "$target_path"
    
    # Verify the copy was successful
    if [[ -d "$target_path" ]]; then
        # Count files in the copied directory
        file_count=$(find "$target_path" -type f | wc -l | tr -d ' ')
        echo "✅ Copied: $target_name ($file_count files)"
        ((copy_count++))
    else
        echo "❌ Failed to copy: $target_name"
    fi
done

echo ""
echo "🎉 Setup complete!"
echo "📁 Created $symlink_count symlinks and copied $copy_count directories in $TARGET_DIR"

# List created items
echo ""
echo "📋 Summary:"
echo ""
echo "Symlinks created:"
for link in "${valid_symlinks[@]}"; do
    source="${link%%:*}"
    target_name="${link##*:}"
    target_path="$TARGET_DIR/$target_name"
    
    if [[ -L "$target_path" ]]; then
        echo "   🔗 $target_name -> $source"
    fi
done

echo ""
echo "Directories copied:"
for copy in "${valid_copies[@]}"; do
    source="${copy%%:*}"
    target_name="${copy##*:}"
    target_path="$TARGET_DIR/$target_name"
    
    if [[ -d "$target_path" ]]; then
        file_count=$(find "$target_path" -type f | wc -l | tr -d ' ')
        echo "   📦 $target_name/ ($file_count files)"
    fi
done
