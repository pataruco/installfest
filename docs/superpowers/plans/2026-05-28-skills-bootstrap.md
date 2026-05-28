# Skills Bootstrap Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Vendor the author's 5 hand-curated skill bundles + custom subagent + plain-text manifests into `configs/skills/`, and add an "Agent Skills" section to the main `readme.md` that installs everything on a fresh Mac.

**Architecture:** Two manifest files (`claude-plugins.txt`, `anthropic-skills.txt`) drive bulk install loops; everything else is plain-file vendoring. Install target is `~/.agents/skills/` with `~/.claude/skills/` symlinked to it, so both Zed and Claude Code read the same set. No helper scripts — install commands live as inline shell in the readme.

**Tech Stack:** bash, git, Markdown, plain text manifests. `jq` and `unzip` for one-off population.

**Spec:** [`docs/superpowers/specs/2026-05-28-skills-bootstrap-design.md`](../specs/2026-05-28-skills-bootstrap-design.md)

---

## File Structure

**Created:**
- `configs/skills/readme.md` — explains the layout, points at main readme for install
- `configs/skills/claude-plugins.txt` — 15 lines, `<plugin>@<marketplace>` format
- `configs/skills/anthropic-skills.txt` — 16 lines, one skill name per line
- `configs/skills/bundles/content-design/` — unpacked from `~/Downloads/content-design.skill`
- `configs/skills/bundles/cover-letter-writing/` — unpacked from `~/Downloads/cover-letter-writing.skill`
- `configs/skills/bundles/documentation/` — unpacked from `~/Downloads/documentation.skill`
- `configs/skills/bundles/nodejs-core/` — unpacked from `~/Downloads/nodejs-core.skill`
- `configs/skills/bundles/typescript-magician/` — unpacked from `~/Downloads/typescript-magician.skill`
- `configs/skills/agents/code-challenge-reviewer.md` — copied from `~/.claude/agents/code-challenge-reviewer.md`

**Modified:**
- `readme.md` — inserted "Agent Skills" section after the existing Zed section (around line 44)

---

## Task 1: Create `configs/skills/` skeleton and intra-folder readme

**Files:**
- Create: `configs/skills/readme.md`
- Create: `configs/skills/bundles/` (empty placeholder, populated in Task 4)
- Create: `configs/skills/agents/` (empty placeholder, populated in Task 5)

- [ ] **Step 1: Create the folder structure**

```bash
mkdir -p configs/skills/bundles configs/skills/agents
```

- [ ] **Step 2: Write `configs/skills/readme.md`**

Create `configs/skills/readme.md` with this exact content:

````markdown
# Agent Skills bundle

This directory captures the author's [agent skills](https://zed.dev/docs/ai/skills) setup so a fresh Mac can reproduce it. Skills installed here work in both Zed and Claude Code (Zed reads `~/.agents/skills/`, Claude Code reads `~/.claude/skills/`; the main install symlinks the second to the first).

## Layout

| Path | Contents |
|---|---|
| `claude-plugins.txt` | One `<plugin>@<marketplace>` per line. Driven into `claude plugin install` by an `xargs` loop. |
| `anthropic-skills.txt` | One skill name per line. Names match folders under `skills/` in [`anthropics/skills`](https://github.com/anthropics/skills). |
| `bundles/<name>/` | Hand-curated skill bundles vendored from `.skill` zip archives. Each contains `SKILL.md` and optionally `scripts/`, `references/`, `assets/`. |
| `agents/<name>.md` | Custom Claude Code subagents. |

## Install

See the **Agent Skills** section in the main [`readme.md`](../../readme.md) for the install steps. The install:

1. Registers the `accesslint` and `anthropics/skills` plugin marketplaces.
2. Runs `claude plugin install` for every line in `claude-plugins.txt`.
3. Copies the agent files into `~/.claude/agents/`.
4. Creates `~/.agents/skills/` and symlinks `~/.claude/skills/` to it.
5. Copies the `bundles/` into the symlinked target.
6. Sparse-clones the names in `anthropic-skills.txt` from the registry.

## Maintaining this directory

| When | Do |
|---|---|
| You enable a Claude plugin | Append `<plugin>@<marketplace>` to `claude-plugins.txt` and commit. |
| You want a new Anthropic registry skill | Append the name to `anthropic-skills.txt` and commit. |
| You drop a new `.skill` zip in `~/Downloads/` | Run `unzip -q ~/Downloads/<name>.skill -d configs/skills/bundles/` and commit. |
| You author a new local skill | Run `cp -R ~/.agents/skills/<name> configs/skills/bundles/` and commit. |
````

- [ ] **Step 3: Verify**

Run:
```bash
ls configs/skills/
```

Expected output:
```
agents
bundles
readme.md
```

- [ ] **Step 4: Commit**

```bash
git add configs/skills/
git commit -m "configs/skills: scaffold directory and intra-folder readme"
```

---

## Task 2: Generate `claude-plugins.txt`

**Files:**
- Create: `configs/skills/claude-plugins.txt`

- [ ] **Step 1: Generate the list of currently-enabled plugins from `~/.claude/settings.json`**

Run:
```bash
jq -r '.enabledPlugins | to_entries[] | select(.value==true) | .key' ~/.claude/settings.json | sort > configs/skills/claude-plugins.txt
```

This produces 15 lines (the 15 plugins with `true` in `enabledPlugins`).

- [ ] **Step 2: Append the disabled `firebase` plugin**

The author wants `firebase` included in the install even though it is currently disabled in their settings. Append it:

```bash
echo "firebase@claude-plugins-official" >> configs/skills/claude-plugins.txt
sort -o configs/skills/claude-plugins.txt configs/skills/claude-plugins.txt
```

- [ ] **Step 3: Verify the file has exactly 16 lines and the expected plugins**

Run:
```bash
wc -l configs/skills/claude-plugins.txt
cat configs/skills/claude-plugins.txt
```

Expected: `16 configs/skills/claude-plugins.txt`, and the file should contain (alphabetical):
```
accesslint@accesslint
claude-code-setup@claude-plugins-official
code-simplifier@claude-plugins-official
commit-commands@claude-plugins-official
explanatory-output-style@claude-plugins-official
feature-dev@claude-plugins-official
firebase@claude-plugins-official
firecrawl@claude-plugins-official
frontend-design@claude-plugins-official
github@claude-plugins-official
ralph-loop@claude-plugins-official
rust-analyzer-lsp@claude-plugins-official
security-guidance@claude-plugins-official
skill-creator@claude-plugins-official
superpowers@claude-plugins-official
typescript-lsp@claude-plugins-official
```

(15 entries are sourced from `enabledPlugins[*] == true` and 1 — `firebase` — was appended manually because the author wants it in the install list even though they currently keep it disabled.)

- [ ] **Step 4: Commit**

```bash
git add configs/skills/claude-plugins.txt
git commit -m "configs/skills: add claude-plugins.txt manifest"
```

---

## Task 3: Author `anthropic-skills.txt`

**Files:**
- Create: `configs/skills/anthropic-skills.txt`

- [ ] **Step 1: Write the 16 selected skill names, one per line, alphabetically sorted**

Create `configs/skills/anthropic-skills.txt` with this exact content:

```
algorithmic-art
brand-guidelines
canvas-design
claude-api
doc-coauthoring
docx
frontend-design
internal-comms
mcp-builder
pdf
pptx
skill-creator
slack-gif-creator
theme-factory
webapp-testing
xlsx
```

- [ ] **Step 2: Verify the file has exactly 16 lines**

Run:
```bash
wc -l configs/skills/anthropic-skills.txt
```

Expected: `16 configs/skills/anthropic-skills.txt`

- [ ] **Step 3: Verify each name corresponds to a real folder in the registry**

Run:
```bash
while read -r skill; do
  gh api "repos/anthropics/skills/contents/skills/$skill" --jq '.[0].name' > /dev/null 2>&1 \
    && echo "OK   $skill" \
    || echo "FAIL $skill"
done < configs/skills/anthropic-skills.txt
```

Expected: all 16 lines say `OK`. If any say `FAIL`, the registry has moved or renamed; investigate before committing.

- [ ] **Step 4: Commit**

```bash
git add configs/skills/anthropic-skills.txt
git commit -m "configs/skills: add anthropic-skills.txt manifest"
```

---

## Task 4: Vendor the 5 hand-curated `.skill` bundles

**Files:**
- Create: `configs/skills/bundles/content-design/` (unpacked from `~/Downloads/content-design.skill`)
- Create: `configs/skills/bundles/cover-letter-writing/` (unpacked from `~/Downloads/cover-letter-writing.skill`)
- Create: `configs/skills/bundles/documentation/` (unpacked from `~/Downloads/documentation.skill`)
- Create: `configs/skills/bundles/nodejs-core/` (unpacked from `~/Downloads/nodejs-core.skill`)
- Create: `configs/skills/bundles/typescript-magician/` (unpacked from `~/Downloads/typescript-magician.skill`)

- [ ] **Step 1: Confirm the 5 zip bundles still exist and are zips**

Run:
```bash
file ~/Downloads/*.skill
```

Expected: 5 lines, each ending in `Zip archive data, ...`.

- [ ] **Step 2: Unzip each into `configs/skills/bundles/`**

Each `.skill` zip contains a top-level folder matching the file's base name (verified for `documentation.skill`, which contains `documentation/SKILL.md`). So `-d configs/skills/bundles/` will produce `configs/skills/bundles/<name>/`.

Run:
```bash
for f in ~/Downloads/*.skill; do
  unzip -q "$f" -d configs/skills/bundles/
done
```

- [ ] **Step 3: Verify all 5 bundle folders exist and each has a `SKILL.md`**

Run:
```bash
for d in configs/skills/bundles/*/; do
  name=$(basename "$d")
  if [ -f "$d/SKILL.md" ]; then
    echo "OK   $name"
  else
    echo "FAIL $name (no SKILL.md)"
  fi
done
```

Expected: 5 lines, all `OK`:
```
OK   content-design
OK   cover-letter-writing
OK   documentation
OK   nodejs-core
OK   typescript-magician
```

- [ ] **Step 4: Verify each `SKILL.md` has the required frontmatter fields**

Run:
```bash
for d in configs/skills/bundles/*/; do
  name=$(basename "$d")
  has_name=$(grep -c '^name:' "$d/SKILL.md")
  has_desc=$(grep -c '^description:' "$d/SKILL.md")
  echo "$name name=$has_name description=$has_desc"
done
```

Expected: each line shows `name=1 description=1`. If any show `0`, the bundle is malformed — stop and investigate before committing.

- [ ] **Step 5: Commit**

```bash
git add configs/skills/bundles/
git commit -m "configs/skills: vendor 5 hand-curated skill bundles"
```

---

## Task 5: Vendor the custom subagent

**Files:**
- Create: `configs/skills/agents/code-challenge-reviewer.md` (copied from `~/.claude/agents/code-challenge-reviewer.md`)

- [ ] **Step 1: Confirm the source file exists**

Run:
```bash
ls -la ~/.claude/agents/code-challenge-reviewer.md
```

Expected: file exists, non-zero size.

- [ ] **Step 2: Copy the file**

```bash
cp ~/.claude/agents/code-challenge-reviewer.md configs/skills/agents/
```

- [ ] **Step 3: Verify the copy succeeded and the file is non-empty**

Run:
```bash
ls -la configs/skills/agents/code-challenge-reviewer.md
head -5 configs/skills/agents/code-challenge-reviewer.md
```

Expected: file exists, non-zero size, has frontmatter (lines starting with `---` and `name:`).

- [ ] **Step 4: Commit**

```bash
git add configs/skills/agents/
git commit -m "configs/skills: vendor code-challenge-reviewer subagent"
```

---

## Task 6: Add the "Agent Skills" section to the main `readme.md`

**Files:**
- Modify: `readme.md` — insert a new `## Agent Skills` section directly after the existing Zed section (which ends at line ~44 with "Install the CLI integration by press `Zed > Install CLI Integration`").

- [ ] **Step 1: Locate the insertion point**

Run:
```bash
grep -n "Install the CLI integration by press" readme.md
```

Expected: one match around line 43. The new section goes immediately after that line and before the existing `### VS Code` heading.

- [ ] **Step 2: Insert the new section**

Find the line in `readme.md` that reads (exactly):

```
6. Install the CLI integration by press `Zed > Install CLI Integration`
```

Immediately after that line (and before `### VS Code`), insert this block (note the leading blank line for spacing):

````markdown

### Agent Skills

[Agent Skills](https://zed.dev/docs/ai/skills) are reusable instruction packages the AI agent loads on demand. Zed reads them from `~/.agents/skills/`, Claude Code reads them from `~/.claude/skills/`. This installfest puts the canonical set at `~/.agents/skills/` and symlinks `~/.claude/skills/` to it so both tools see the same skills.

This requires the [Claude CLI](https://docs.claude.com/en/docs/claude-code) (set up later in this installfest); if you have not installed it yet, do that first and come back.

1. Register the two extra plugin marketplaces:

   ```sh
   claude plugin marketplace add accesslint/claude-marketplace
   claude plugin marketplace add anthropics/skills
   ```

2. Install the Claude Code plugins listed in [`configs/skills/claude-plugins.txt`](./configs/skills/claude-plugins.txt):

   ```sh
   xargs -L1 claude plugin install < configs/skills/claude-plugins.txt
   ```

   `firebase@claude-plugins-official` ships in the list. Disable it from the Claude UI if you do not need it.

3. Install the custom subagent:

   ```sh
   mkdir -p ~/.claude/agents
   cp configs/skills/agents/code-challenge-reviewer.md ~/.claude/agents/
   ```

4. Create the shared skills directory and symlink `~/.claude/skills/` to it:

   ```sh
   mkdir -p ~/.agents/skills
   ln -sfn ~/.agents/skills ~/.claude/skills
   ```

   `ln -sfn` overwrites any existing `~/.claude/skills/` entry. If you already have skills there from another setup, back them up first.

5. Copy the vendored skill bundles into the shared directory:

   ```sh
   cp -R configs/skills/bundles/* ~/.agents/skills/
   ```

6. Sparse-clone the curated subset of the [Anthropic skills registry](https://github.com/anthropics/skills) listed in [`configs/skills/anthropic-skills.txt`](./configs/skills/anthropic-skills.txt):

   ```sh
   git clone --filter=blob:none --sparse https://github.com/anthropics/skills /tmp/anthropic-skills
   git -C /tmp/anthropic-skills sparse-checkout set $(sed 's|^|skills/|' configs/skills/anthropic-skills.txt | tr '\n' ' ')
   while read -r skill; do
     cp -R "/tmp/anthropic-skills/skills/$skill" ~/.agents/skills/
   done < configs/skills/anthropic-skills.txt
   rm -rf /tmp/anthropic-skills
   ```

7. Verify. Open Zed and type `/` in the agent panel — your installed skills should appear in the completion menu. Optional CLI sanity checks:

   ```sh
   claude plugin list
   readlink ~/.claude/skills      # should print the path to ~/.agents/skills
   ls ~/.agents/skills            # should list all installed skill folders
   ls ~/.claude/agents            # should include code-challenge-reviewer.md
   ```
````

- [ ] **Step 3: Verify the section is in the right place and well-formed**

Run:
```bash
grep -n "^### " readme.md | head -10
```

Expected: the order of `###` headings near the top is:
```
### Zed
### Agent Skills
### VS Code
```

Also verify the section ends before `### VS Code`:
```bash
awk '/^### Agent Skills/,/^### VS Code/' readme.md | tail -5
```

Expected: last lines show the verify step's commands, then the `### VS Code` heading on the final line.

- [ ] **Step 4: Commit**

```bash
git add readme.md
git commit -m "readme: add Agent Skills install section"
```

---

## Task 7: End-to-end verification against a sandbox

The author's current Mac already has the plugins installed via the existing Claude setup. We do not want to re-run install commands against the real `~/.agents/skills/` or `~/.claude/`. Instead, run a dry sandbox that proves the readme commands work as written.

**Files:** none modified. This task only runs verification commands.

- [ ] **Step 1: Set up the sandbox**

```bash
SANDBOX=/tmp/skills-sandbox
rm -rf "$SANDBOX"
mkdir -p "$SANDBOX/.agents/skills" "$SANDBOX/.claude/agents"
```

- [ ] **Step 2: Test the symlink command (readme step 4)**

```bash
mkdir -p "$SANDBOX/.agents/skills"
ln -sfn "$SANDBOX/.agents/skills" "$SANDBOX/.claude/skills"
readlink "$SANDBOX/.claude/skills"
```

Expected: prints `/tmp/skills-sandbox/.agents/skills`.

- [ ] **Step 3: Test the bundle copy (readme step 5)**

```bash
cp -R configs/skills/bundles/* "$SANDBOX/.agents/skills/"
ls "$SANDBOX/.agents/skills"
```

Expected output (alphabetical):
```
content-design
cover-letter-writing
documentation
nodejs-core
typescript-magician
```

- [ ] **Step 4: Test the agent copy (readme step 3)**

```bash
cp configs/skills/agents/code-challenge-reviewer.md "$SANDBOX/.claude/agents/"
ls "$SANDBOX/.claude/agents"
```

Expected: `code-challenge-reviewer.md`.

- [ ] **Step 5: Test the sparse-clone block (readme step 6)**

This actually hits GitHub; only run if online. Skip with a note if not.

```bash
git clone --filter=blob:none --sparse https://github.com/anthropics/skills /tmp/anthropic-skills
git -C /tmp/anthropic-skills sparse-checkout set $(sed 's|^|skills/|' configs/skills/anthropic-skills.txt | tr '\n' ' ')
while read -r skill; do
  cp -R "/tmp/anthropic-skills/skills/$skill" "$SANDBOX/.agents/skills/"
done < configs/skills/anthropic-skills.txt
rm -rf /tmp/anthropic-skills
ls "$SANDBOX/.agents/skills" | wc -l
```

Expected: prints `21` (5 vendored + 16 registry).

- [ ] **Step 6: Confirm each registry skill folder has a `SKILL.md`**

```bash
missing=0
while read -r skill; do
  if [ ! -f "$SANDBOX/.agents/skills/$skill/SKILL.md" ]; then
    echo "MISSING: $skill"
    missing=$((missing+1))
  fi
done < configs/skills/anthropic-skills.txt
echo "missing count: $missing"
```

Expected: `missing count: 0`.

- [ ] **Step 7: Tear down sandbox**

```bash
rm -rf /tmp/skills-sandbox
```

- [ ] **Step 8: Do NOT commit anything in this task**

Verification produces no files in the repo. Nothing to add or commit.

---

## Post-task self-check

After all 7 tasks complete, confirm:

- [ ] `git log --oneline` since the branch root shows 6 commits (one per Task 1–6).
- [ ] `git status` is clean.
- [ ] `ls configs/skills/` shows exactly: `agents`, `anthropic-skills.txt`, `bundles`, `claude-plugins.txt`, `readme.md`.
- [ ] `readme.md` contains the new `### Agent Skills` section between `### Zed` and `### VS Code`.

Open a PR titled `feat: add agent skills bootstrap for fresh Mac installs` against `main`. Reference the spec in the PR body.
