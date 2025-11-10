# Enabling GitHub Template Repository

This repository is designed to be used as a GitHub template. To enable the template feature:

## Steps to Enable Template Repository Setting

1. **Go to Repository Settings**
   - Navigate to: `https://github.com/trickstertwo/claude/settings`
   - Or click "Settings" tab in the repository

2. **Enable Template Repository**
   - Scroll down to the "Template repository" section
   - Check the box: ☑️ "Template repository"
   - This allows users to click "Use this template" to create new repositories

3. **Verify**
   - Go to the repository main page
   - You should see a green "Use this template" button at the top
   - Users can now create new repositories based on this template

## What This Enables

Once enabled, users can:
- Click "Use this template" button on the repository page
- Create a new repository with all the template files
- Start with a clean Git history (no fork relationship)
- Customize their copy without affecting the original

## Alternative: Using Without Template Feature

If the template repository setting is not enabled, users can still:
- Clone or fork the repository manually
- Use the provided copy scripts (`copy-to-project.sh` or `copy-to-project.bat`)
- Copy the `.claude` directory manually

However, the "Use this template" button provides the best user experience.

## Documentation Updated

The following files have been updated to reflect template repository usage:
- `README.md` - Added "Use this template" instructions as Option 1
- `QUICK_START.md` - Updated with template-first approach
- `WHAT_YOU_GET.md` - Updated examples to show template usage
- `.gitignore` - Added to prevent committing temporary files
- `LICENSE` - Added MIT license for open template usage

## Note

This file is for the repository maintainer's reference and can be deleted after enabling the template repository setting.
