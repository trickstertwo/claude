# ⚡ Quick Start: 2 Minutes to Full Automation

## For Your NEXT Project (Not This One)

### Option 1: Use GitHub Template (Recommended)

```bash
# 1. Click "Use this template" on GitHub
# 2. Clone your new repository
git clone https://github.com/YOUR-USERNAME/YOUR-PROJECT-NAME
cd YOUR-PROJECT-NAME

# 3. Open in Claude Code

# 4. Type one command:
/init-automation

# 5. Answer 8 questions (2 minutes):
#    - Project type? (CLI/API/Library/etc.)
#    - Language? (Rust/TypeScript/Python/Go/etc.)
#    - Framework? (if any)
#    - Build command? Choose recommended? (cargo build, npm build, etc.)
#    - Test command? Choose recommended? (cargo test, npm test, etc.)
#    - Linter? Choose recommended? (cargo clippy, eslint, etc.)
#    - Formatter? Choose recommended? (cargo fmt, prettier, etc.)
#    - Dev docs? (yes recommended)

# ✅ DONE! Claude generates everything customized to YOUR stack
```

### Option 2: Manual Copy (Alternative)

```bash
# 1. Copy .claude folder to your new project
cd /path/to/your/new/project
cp -r /path/to/claude/.claude .

# 2. Open in Claude Code

# 3. Type one command:
/init-automation

# 4. Answer 8 questions (2 minutes)
# ... same as above ...
```

**Total Time**: 10 minutes (questions + generation + verification)

**What You Get**:
- ✅ 3 hooks (300 lines) - Auto-enforcement with YOUR commands
- ✅ Skills (500+ lines) - YOUR language patterns
- ✅ 3+ agents (1500+ lines) - YOUR tech stack reviewers
- ✅ Directory structure
- ✅ .gitignore updates

---

## What Happens After `/init-automation`

Claude will:

1. **Ask Questions** (8 focused questions, 2 min)
2. **Generate Hooks** - TypeScript files with YOUR build commands
3. **Generate Skills** - Language-specific patterns and triggers
4. **Generate Agents** - Code reviewer, error resolver, testing expert
5. **Create Directories** - dev/active, dev/archive (optional)
6. **Test Hooks** - Verify automation works
7. **Provide Verification Steps** - You test it works

**Example Output**:
```
🎉 Claude Code Automation Initialized

✅ Created Files:
   - .claude/hooks/user-prompt-submit.ts
   - .claude/hooks/stop.ts
   - .claude/hooks/post-tool-use.ts
   - .claude/skill-rules.json
   - .claude/skills/rust-dev-guidelines.md
   - .claude/agents/rust-code-reviewer.md
   - .claude/agents/cargo-error-resolver.md
   - .claude/agents/rust-testing-expert.md

📋 Your Commands:
   Build: cargo build
   Test: cargo test
   Lint: cargo clippy
   Format: cargo fmt

🧪 Verification: Create test.rs, edit it via Claude, check hook runs
```

---

## What Each File Does

**Hooks** (Run Automatically):
- `user-prompt-submit.ts` - Injects skill reminders BEFORE Claude sees prompt
- `stop.ts` - Runs YOUR build command AFTER Claude responds
- `post-tool-use.ts` - Tracks edited files

**Skills** (Auto-Activated):
- `skill-rules.json` - Defines trigger patterns
- `{language}-dev-guidelines.md` - Best practices, patterns

**Agents** (Manual/Automated):
- `{language}-code-reviewer` - Reviews code (/code-review command)
- `{tool}-error-resolver` - Fixes errors systematically
- `{language}-testing-expert` - Writes comprehensive tests

---

## Usage After Setup

**Normal Workflow**:
```
You: "Add authentication to my API"

[user-prompt-submit hook injects skill reminders]
Claude: [Uses your patterns automatically]
[Implements code]
[stop hook runs YOUR build command]
[Shows errors if any]

You: /code-review
[Launches code-reviewer agent]
Agent: "✓ Error handling good, ⚠️ Missing tests"

You: "Add tests"
Claude: [Uses testing-expert patterns]
[stop hook verifies tests pass]
```

**Key Benefits**:
- ⚡ No manual reminders needed
- ⚡ Errors caught immediately
- ⚡ Patterns enforced automatically
- ⚡ Consistent reviews
- ⚡ Works across context compaction

---

## Files in This Template

```
claude-template/
├── .claude/
│   ├── agents/
│   │   └── project-initializer.md    # Does the setup
│   └── commands/
│       └── init-automation.md         # Slash command
├── .gitignore                         # Template-safe ignores
├── LICENSE                            # MIT license
├── copy-to-project.sh                 # Linux/Mac copy script (optional)
├── copy-to-project.bat                # Windows copy script (optional)
├── README.md                          # Full documentation
├── WHAT_YOU_GET.md                    # Detailed breakdown
└── QUICK_START.md                     # This file
```

---

## Copy Scripts (For Manual Copy Only)

If you prefer manual copying instead of using GitHub's template feature:

**Linux/Mac**:
```bash
cd /your/new/project
/path/to/claude/copy-to-project.sh .
```

**Windows**:
```cmd
cd C:\your\new\project
C:\path\to\claude\copy-to-project.bat .
```

Then run `/init-automation` in Claude Code.

---

## Next Steps

1. ✅ **Use GitHub template** OR **copy .claude folder** to your new project
2. ✅ **Run `/init-automation`** in Claude Code
3. ✅ **Answer 8 questions** (2 minutes)
4. ✅ **Verify hooks work** (create test file, edit it)
5. 📖 **Read WHAT_YOU_GET.md** for detailed breakdown
6. 📖 **Read README.md** for full documentation

---

## Troubleshooting

**Hook error "Cannot find module"**:
- Need Node.js v16+: `node --version`
- Install if missing

**Hooks don't run**:
- Check syntax: `node -c .claude/hooks/stop.ts`
- Restart Claude Code

**Wrong language generated**:
- Run `/init-automation` again
- Will overwrite with correct answers

---

## Support

- **Full docs**: `README.md` in this folder
- **Deep dive**: `../PROJECT_INITIALIZATION_GUIDE.md`
- **Examples**: TOAD's `.claude/agents/` folder

**Time Investment**: 10 minutes
**Time Saved**: 2-4 hours setup + ongoing daily consistency
**Proven**: 300k LOC production use

Ready to automate your next project! 🚀
