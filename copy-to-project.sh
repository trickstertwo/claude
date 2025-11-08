#!/bin/bash
# Copy Claude Code automation template to a new project

set -e

if [ -z "$1" ]; then
  echo "Usage: ./copy-to-project.sh /path/to/your/project"
  echo ""
  echo "This will copy the .claude automation files to your project."
  exit 1
fi

PROJECT_PATH="$1"

if [ ! -d "$PROJECT_PATH" ]; then
  echo "Error: Directory $PROJECT_PATH does not exist"
  exit 1
fi

echo "📦 Copying Claude Code automation to: $PROJECT_PATH"
echo ""

# Copy .claude directory
cp -r .claude "$PROJECT_PATH/"

echo "✅ Copied .claude/ directory"
echo ""
echo "🎯 Next steps:"
echo "  1. cd $PROJECT_PATH"
echo "  2. Open in Claude Code"
echo "  3. Type: /init-automation"
echo "  4. Answer 8 questions about your tech stack"
echo "  5. Done! Full automation configured"
echo ""
echo "⏱️  Total time: ~10 minutes"
