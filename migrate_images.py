#!/usr/bin/env python3
"""
Migrate images from public/resources/images/blog/ to content/weblog/media/YYYY/MM/
and update markdown files with new paths.
"""
import os
import re
import shutil
from pathlib import Path
from collections import defaultdict

# Base paths
REPO_ROOT = Path("/Users/pwagstro/Documents/workspace/patrick.wagstrom.net")
OLD_IMAGE_DIR = REPO_ROOT / "public/resources/images/blog"
WEBLOG_DIR = REPO_ROOT / "content/weblog"
MEDIA_DIR = REPO_ROOT / "content/weblog/media"

def find_post_for_image(image_name):
    """Find the blog post that references this image."""
    pattern = f"/resources/images/blog/{image_name}"
    for post_file in WEBLOG_DIR.glob("*.md"):
        try:
            content = post_file.read_text()
            if pattern in content:
                return post_file
        except:
            continue
    return None

def extract_date_from_post(post_file):
    """Extract year and month from post filename (YYYY-MM-DD-title.md)."""
    match = re.match(r'(\d{4})-(\d{2})-\d{2}', post_file.name)
    if match:
        return match.group(1), match.group(2)
    return None, None

def migrate_image(mapping):
    """Move image to content/weblog/media/YYYY/MM/ and update post."""
    year = mapping['year']
    month = mapping['month']
    image_file = mapping['image']
    post_file = mapping['post']

    # Create target directory
    target_dir = MEDIA_DIR / year / month
    target_dir.mkdir(parents=True, exist_ok=True)

    # Copy image to new location
    target_file = target_dir / image_file.name
    if not target_file.exists():
        shutil.copy2(image_file, target_file)
        print(f"  Copied {image_file.name} to {target_dir}")
    else:
        print(f"  Skipped {image_file.name} (already exists)")

    # Update markdown file
    old_path = f"/resources/images/blog/{image_file.name}"
    new_path = f"/weblog/media/{year}/{month}/{image_file.name}"

    content = post_file.read_text()
    if old_path in content:
        new_content = content.replace(old_path, new_path)
        post_file.write_text(new_content)
        print(f"  Updated {post_file.name}")
        return True
    return False

def main():
    if not OLD_IMAGE_DIR.exists():
        print(f"Image directory not found: {OLD_IMAGE_DIR}")
        return

    # Collect all images and their mappings
    image_mappings = []
    unmapped_images = []

    for image_file in OLD_IMAGE_DIR.iterdir():
        if image_file.is_file():
            post_file = find_post_for_image(image_file.name)
            if post_file:
                year, month = extract_date_from_post(post_file)
                if year and month:
                    image_mappings.append({
                        'image': image_file,
                        'post': post_file,
                        'year': year,
                        'month': month
                    })
                else:
                    unmapped_images.append((image_file.name, "no_date"))
            else:
                unmapped_images.append((image_file.name, "no_post"))

    # Report findings
    print(f"Found {len(image_mappings)} images with post mappings")
    print(f"Found {len(unmapped_images)} unmapped images")

    print("\n" + "="*60)
    print("MIGRATING IMAGES")
    print("="*60)

    # Perform migration
    migrated_count = 0
    for mapping in image_mappings:
        if migrate_image(mapping):
            migrated_count += 1

    print("\n" + "="*60)
    print(f"MIGRATION COMPLETE: {migrated_count} posts updated")
    print("="*60)

if __name__ == "__main__":
    main()
