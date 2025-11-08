# What You Get: Automated Claude Code Setup

**TL;DR**: Use this as a GitHub template OR run `/init-automation` in any new project → Answer 8 questions → Get fully customized automation in 10 minutes.

---

## The Problem This Solves

**Without automation**:
- ❌ Claude forgets patterns between sessions
- ❌ Errors slip through unnoticed
- ❌ No enforcement of your standards
- ❌ Manual skill reminders every time
- ❌ "Losing the plot" across context limits
- ❌ 2-4 hours manual setup per project

**With this system**:
- ✅ Patterns enforced automatically (hooks)
- ✅ Build runs after EVERY response (catches errors immediately)
- ✅ Skills auto-activate (no need to remember)
- ✅ Agents provide consistent reviews
- ✅ Dev docs survive context compaction
- ✅ 10 minutes automated setup

---

## Files You Get

When you run `/init-automation`, Claude generates these files customized to YOUR tech stack:

### 🪝 Hooks (3 files, ~300 lines total)

**`.claude/hooks/user-prompt-submit.ts`**
- **What**: Runs BEFORE Claude sees your prompt
- **Does**: Checks if your prompt matches skill patterns, injects reminder
- **Example**: You type "add error handling" → Hook adds "🎯 Consider using: rust-dev-guidelines skill"
- **Customized**: Patterns match YOUR language (Rust keywords vs TypeScript keywords)

**`.claude/hooks/stop.ts`**
- **What**: Runs AFTER Claude responds
- **Does**: Executes YOUR build command, shows errors if any
- **Example**: Claude edits code → Hook runs `cargo check` → Shows 3 compiler errors
- **Customized**: Uses YOUR actual build/test/lint commands

**`.claude/hooks/post-tool-use.ts`**
- **What**: Runs after Claude uses Edit/Write tools
- **Does**: Tracks which files were modified (used by stop hook)
- **Example**: Claude edits `main.rs` → Logged → Stop hook knows to run build
- **Customized**: Works with any file types

### 📚 Skills (2+ files, ~500-800 lines total)

**`.claude/skill-rules.json`**
- **What**: Defines when skills auto-activate
- **Does**: Maps keywords/patterns to skills
- **Example**: Keywords ["async", "tokio"] → Activates "rust-dev-guidelines"
- **Customized**: YOUR language keywords (Rust traits vs Python classes)

**`.claude/skills/{language}-dev-guidelines.md`**
- **What**: Main skill file with patterns (< 500 lines)
- **Does**: Language-specific best practices, error handling, testing patterns
- **Example**: Shows Rust Result<T,E> pattern vs TypeScript try/catch
- **Customized**: YOUR language + framework conventions

**`.claude/skills/resources/*.md`** (optional)
- **What**: Detailed examples (progressive disclosure)
- **Does**: Loaded only when needed (40-60% token reduction)
- **Example**: `error-handling.md` with 20+ pattern examples
- **Customized**: YOUR project's specific patterns

### 🤖 Agents (3+ files, ~400-600 lines each)

**`.claude/agents/{language}-code-reviewer.md`**
- **What**: Reviews code for language-specific issues
- **Does**: Checks error handling, async patterns, test coverage, docs
- **Example**: Detects `unwrap()` in Rust production code, suggests `?` operator
- **Customized**: YOUR language rules (Rust clippy vs ESLint)
- **Usage**: Run `/code-review` after implementing

**`.claude/agents/{tool}-error-resolver.md`**
- **What**: Systematically fixes compiler/linter errors
- **Does**: Categorizes errors (root cause vs dependent), fixes in order
- **Example**: Fixes lifetime errors before borrow checker errors
- **Customized**: YOUR build tool (cargo vs npm vs pytest)
- **Usage**: Hook suggests when build has errors

**`.claude/agents/{language}-testing-expert.md`**
- **What**: Writes comprehensive tests
- **Does**: Table-driven tests, property-based tests, async tests
- **Example**: Generates 95%+ coverage for Rust models, 80%+ for services
- **Customized**: YOUR testing framework (tokio::test vs Jest)
- **Usage**: After writing code without tests

### 📁 Directories (2-3 folders)

**`dev/active/[task-name]/`** (if enabled)
- **What**: Per-task tracking that survives context compaction
- **Does**: Stores plan.md, context.md, tasks.md for each feature
- **Example**: Implementing auth? → `dev/active/auth/plan.md` has steps
- **Why**: You can read this after compaction to remember what you were doing

**`dev/archive/[task-name]/`** (if enabled)
- **What**: Completed tasks for reference
- **Does**: Historical record of decisions, patterns used
- **Example**: "How did we implement caching?" → Check `dev/archive/caching/`

---

## How It Works (End-to-End Example)

### Scenario: New TypeScript API Project

**Step 1: Use GitHub Template**
```bash
# Click "Use this template" on GitHub
# Create new repository: my-new-api
# Clone it
cd ~/my-new-api
```

**Step 2: Initialize**
```
Type in Claude Code: /init-automation

Q: Language?
A: TypeScript

Q: Framework?
A: Node.js

Q: Build command?
A: npm run build

Q: Test command?
A: npm test

Q: Linter?
A: eslint .

Q: Formatter?
A: prettier --write .

Q: Dev docs?
A: yes

Q: Project type?
A: Web API

[2 minutes of questions]
```

**Step 3: Claude Generates** (takes ~5 minutes)
- Creates all 8+ files
- Customizes with YOUR commands
- Tests that hooks work
- Provides verification steps

**Step 4: Verify**
```typescript
// Create test.ts
export function add(a: number, b: number): number {
  return a + b // Missing semicolon
}
```

Edit via Claude Code → Stop hook runs:
```
🔍 Build Check
━━━━━━━━━━━━━━━━━━━━━━━━━━
Running: npm run build

⚠️  Issues detected:
   error TS1005: ';' expected

💡 Fix these before continuing
━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Step 5: Use It**
```
You: "Add authentication middleware with JWT"

[Skills auto-activate]
🎯 SKILL ACTIVATION CHECK
- typescript-dev-guidelines
- auth-patterns (if you added this)

Claude: [Implements using your patterns]

[Stop hook runs npm run build]
✅ Build passed

You: /code-review

[typescript-code-reviewer agent launches]
✓ Error handling: Good (try/catch used)
✓ Async patterns: Good (promises handled)
⚠️  Test coverage: Missing (suggest tests)
✓ Documentation: Good (JSDoc present)

Recommendation: Add unit tests before merging
```

---

## What Makes Each File Special

### Skills vs Agents - What's the Difference?

**Skills** (Pattern Libraries):
- Passive reference docs
- Auto-activate via hooks
- Always available in context
- < 500 lines (lightweight)
- Example: "Use Result<T,E> for errors in Rust"

**Agents** (Active Assistants):
- Interactive specialized workers
- Manually invoked (slash commands or automated)
- Perform analysis and make decisions
- 400-600 lines (comprehensive)
- Example: "Analyze this code, find 3 issues, suggest fixes"

**Hooks** (Auto-Enforcement):
- Run automatically (before prompt, after response, after tool use)
- No manual invocation needed
- Enforce quality gates
- < 100 lines each
- Example: "Build failed? Show errors immediately"

### Why Hooks Are Critical

**Without hooks** (typical approach):
```
You: "Use the rust-dev-guidelines skill when writing code"
[Next prompt]
Claude: [Forgets, doesn't use skill]
You: "Remember to use rust-dev-guidelines!"
[Every. Single. Time.]
```

**With hooks** (this system):
```
You: "Implement error handling"
[user-prompt-submit.ts injects reminder]
Claude: [Sees "🎯 rust-dev-guidelines activated", uses it automatically]
[Writes code]
[stop.ts runs cargo check, shows any errors]
Claude: [Sees errors immediately, fixes them]
[No manual reminders needed]
```

---

## Language Support

Currently supports generation for:

| Language | Hooks | Skills | Agents | Quality |
|----------|-------|--------|--------|---------|
| **Rust** | ✅ | ✅ | ✅ cargo-error-resolver, rust-code-reviewer, rust-testing-expert | Production-tested (TOAD) |
| **TypeScript** | ✅ | ✅ | ✅ npm-error-resolver, typescript-code-reviewer, jest-expert | Planned |
| **Python** | ✅ | ✅ | ✅ pytest-expert, python-code-reviewer, python-error-resolver | Planned |
| **Go** | ✅ | ✅ | ✅ go-code-reviewer, go-testing-expert | Planned |
| **Java** | ✅ | ✅ | ⚠️ (generic) | Planned |
| **C++** | ✅ | ✅ | ⚠️ (generic) | Planned |

**Note**: TypeScript/Python/Go agents are templates adapted from Rust patterns. Customize after generation.

---

## Customization Examples

After initialization, you can customize for your project:

### Add Project-Specific Patterns to Skills

```markdown
<!-- In .claude/skills/rust-dev-guidelines.md -->

## Our Error Handling Pattern

We use anyhow for applications, thiserror for libraries:

```rust
// Application code
use anyhow::{Context, Result};

fn load_config() -> Result<Config> {
    let path = "config.toml";
    let content = fs::read_to_string(path)
        .context("Failed to read config")?;
    toml::from_str(&content)
        .context("Failed to parse config")
}
```

This pattern is now enforced across the project.
```

### Add Custom Slash Commands

```markdown
<!-- .claude/commands/run-migration.md -->
---
description: Run database migrations and update schema
---

Run the database migration workflow:

1. Run: `cargo run -- migrate`
2. Verify migrations applied: `cargo run -- migrate status`
3. Update schema.rs if needed
4. Run tests: `cargo test db::`

If migrations fail, check `.toad/migration-log.txt` for details.
```

### Create Domain-Specific Agents

```markdown
<!-- .claude/agents/api-design-expert.md -->
---
name: api-design-expert
description: Reviews API design for REST best practices, consistent error responses, proper status codes
model: sonnet
---

You are an API Design Expert reviewing REST API implementations.

## Review Checklist

- [ ] Proper HTTP verbs (GET/POST/PUT/DELETE/PATCH)
- [ ] Consistent error response format
- [ ] Appropriate status codes (200/201/400/404/500)
- [ ] Query parameter validation
- [ ] Request body validation
- [ ] Rate limiting considered
- [ ] API versioning (if multi-version)

[... detailed review logic ...]
```

---

## ROI Analysis

**Time Investment**:
- Initial setup: 10 minutes (8 questions + generation)
- Customization: 30-60 minutes (add your patterns over first week)
- **Total**: ~1 hour

**Time Saved**:
- No manual hook setup: 2 hours
- No skill creation: 1 hour
- No agent creation: 1 hour
- Ongoing consistency: 15-30 min/day (no repeated reminders)
- **Total**: 4+ hours first project, ongoing daily savings

**Break-Even**: After 1 project

**Proven Track Record**: 300k LOC rewrite over 6 months with this system

---

## Next Steps

1. ✅ **You're already set up** (if you ran `/init-automation`)
2. 📖 **Read the Guide**: `../PROJECT_INITIALIZATION_GUIDE.md` for "why"
3. 🧪 **Test Drive**: Implement a small feature end-to-end
4. 🎨 **Customize**: Add your patterns to skills as you code
5. 🤖 **Create Commands**: Add workflows to `.claude/commands/`
6. 📚 **Reference**: Keep skills < 500 lines (move details to resources/)

---

## Troubleshooting

**Hooks don't run**:
```bash
# Check Node.js
node --version  # Need v16+

# Test hooks manually
cd .claude/hooks
node -c user-prompt-submit.ts  # Should be silent (no errors)

# Restart Claude Code
```

**Skills don't activate**:
- Verify `.claude/skill-rules.json` exists
- Check patterns match your prompt keywords
- Try exact keyword from rules: "async tokio"

**Build check shows wrong command**:
- Edit `.claude/hooks/stop.ts`
- Find line with `execSync('...')`
- Update to your actual command

**Wrong language generated**:
- Run `/init-automation` again
- Answer questions correctly
- Will overwrite old files

---

## Support

- **Issues**: This is a template, not a product. Customize to fit.
- **Guide**: Read `../PROJECT_INITIALIZATION_GUIDE.md` for deep dive
- **Examples**: TOAD project itself uses this system (see `.claude/agents/`)

Your project is now equipped with proven automation. Ship with confidence! 🚀
