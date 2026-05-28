# Skills bootstrap for new Mac installs

**Status:** Design approved, pending implementation plan
**Author:** Pedro Martin
**Date:** 2026-05-28
**Branch:** `zed-skills`

## Background

The `installfest` repo documents how to set up a fresh Mac for development. Zed shipped [agent skills](https://zed.dev/docs/ai/skills) and uses the same `SKILL.md` format as Claude Code. We want a new Mac to end up with the same set of agent skills the author already uses, without manual download steps.

### Inventory finding (the surprise that shaped the design)

There are no hand-authored skill files under `~/.claude/skills/` or `~/.agents/skills/` on the author's current Mac. The author's "skills" come from three distinct sources, each with a different lifecycle:

| Source | What it is | Reproducibility today |
|---|---|---|
| `~/.claude/plugins/cache/*` (15 plugins, 14 enabled + `firebase` disabled) | Plugin-managed, auto-updating skill bundles | Captured by `~/.claude/settings.json` `enabledPlugins` |
| `~/.claude/agents/code-challenge-reviewer.md` | One custom subagent | Not anywhere reproducible |
| `~/Downloads/*.skill` (5 zip archives) | Hand-curated skill bundles in the standard `.skill` zip format | Only on this Mac |

Plugins auto-update via the Claude CLI, so vendoring their files would freeze them at a snapshot and break the update path. The reproducible artefact for "my Claude setup" is the **plugin list**, not the plugin files. The five `.skill` bundles and the one agent file, by contrast, exist only on this Mac and **must** be vendored if they are to survive a Mac replacement.

## Goals

- A new Mac running the installfest ends up with the same skills available in both Zed and Claude Code.
- The author's five hand-curated skill bundles are committed to the repo and recoverable from git alone.
- The custom subagent is committed to the repo.
- The plugin list is committed to the repo as a plain-text manifest; install uses the official `claude` CLI to re-install them.
- A curated subset of the public `anthropics/skills` registry is installed by sparse-cloning at install time, not vendored.
- Install steps are visible in the readme as runnable shell commands; no opaque helper scripts.

## Non-goals

- Uninstall / rollback tooling.
- Interactive idempotency (detecting and merging with a pre-existing `~/.claude/skills/` directory).
- Continuous sync from the author's Mac into the repo. Repo updates are a manual commit workflow.
- Wrapping plugin-marketplace failures with retries.
- Tracking upstream changes to anthropic skills inside this repo.

## Design decisions

| # | Decision | Choice | Rationale |
|---|---|---|---|
| 1 | Install target | Single canonical at `~/.agents/skills/`, with `~/.claude/skills/` as a symlink to it | One source of truth, both editors see the same set, no duplication, trivial to revert. |
| 2 | How to handle `anthropics/skills` | Hybrid: vendor only the author's curated bundles + custom agent; sparse-clone the registry subset at install time | Vendoring would create maintenance debt for upstream-maintained skills. Sparse-clone keeps `~/.agents/skills/` current. |
| 3 | Folder layout in repo | `configs/skills/` alongside other configs (`configs/zed/`, `configs/prettier/`) | Matches existing one-folder-per-tool-concern convention. |
| 4 | Install experience | Plain-text manifests + inline shell loops in the readme — no `.sh` files | Preserves the installfest's pedagogical "see what you're doing" style without 30 lines of copy-paste. |

### Selected registry skills (16 of 17)

From `https://github.com/anthropics/skills`:

`algorithmic-art`, `brand-guidelines`, `canvas-design`, `claude-api`, `doc-coauthoring`, `docx`, `frontend-design`, `internal-comms`, `mcp-builder`, `pdf`, `pptx`, `skill-creator`, `slack-gif-creator`, `theme-factory`, `webapp-testing`, `xlsx`.

Excluded: `web-artifacts-builder`.

`frontend-design` and `skill-creator` also ship as Claude plugins. Installing both creates duplicate catalog entries; runtime dispatch in that case is not guaranteed. Accepted as a known issue; revisit if dispatch becomes flaky.

## Folder layout

```
configs/skills/
├── readme.md                     # Short intro pointing at the main readme for install steps
├── claude-plugins.txt            # One `<plugin>@<marketplace>` per line
├── anthropic-skills.txt          # One skill name per line, matched against anthropics/skills/skills/<name>
├── bundles/                      # Vendored personal skill bundles, unpacked from .skill zips
│   ├── content-design/
│   ├── cover-letter-writing/
│   ├── documentation/
│   ├── nodejs-core/
│   └── typescript-magician/
└── agents/
    └── code-challenge-reviewer.md
```

### File-by-file

| Path | Source | When to hand-edit |
|---|---|---|
| `claude-plugins.txt` | Generated from `~/.claude/settings.json` `enabledPlugins`. Includes `firebase@claude-plugins-official` even though it is currently disabled in the author's settings, on the author's request. | When enabling or disabling a plugin |
| `anthropic-skills.txt` | The 16 selected names | When adding or removing a registry skill |
| `bundles/<name>/` | Unpacked from `~/Downloads/<name>.skill` zip archives. Each contains at least `SKILL.md` and optionally `scripts/`, `references/`, `assets/`. | When authoring or updating a personal skill |
| `agents/code-challenge-reviewer.md` | Copy of `~/.claude/agents/code-challenge-reviewer.md` | When editing the subagent |

## Install flow (the new `readme.md` section)

A new section titled **Agent Skills** is added to `readme.md` after the existing Zed section. The section contains eight numbered steps:

1. **Prerequisites** — note that the Claude CLI must already be installed (handled earlier in the installfest).
2. **Register extra plugin marketplaces** — two explicit commands (named individually because there are only two, named in the readme is clearer than abstracting them):
   ```sh
   claude plugin marketplace add accesslint/claude-marketplace
   claude plugin marketplace add anthropics/skills
   ```
3. **Install Claude Code plugins** — one inline loop:
   ```sh
   xargs -L1 claude plugin install < configs/skills/claude-plugins.txt
   ```
   With a note that `firebase` can be disabled from the Claude UI if not needed.
4. **Install the custom subagent**:
   ```sh
   mkdir -p ~/.claude/agents
   cp configs/skills/agents/code-challenge-reviewer.md ~/.claude/agents/
   ```
5. **Create the shared skills directory and symlink** — establishes the canonical path before anything is copied in:
   ```sh
   mkdir -p ~/.agents/skills
   ln -sfn ~/.agents/skills ~/.claude/skills
   ```
   `ln -sfn` is chosen specifically: `-f` overwrites an existing entry, `-n` prevents the dangerous "symlink into the existing target directory" trap. On a fresh Mac neither flag matters; on a re-run or a partially-set-up Mac, they prevent silent corruption.
6. **Copy the vendored skill bundles**:
   ```sh
   cp -R configs/skills/bundles/* ~/.agents/skills/
   ```
7. **Sparse-clone the Anthropic skills registry** — clones to `/tmp` first so the registry's `.git/` and other top-level files do not end up under `~/.agents/skills/` where they would be parsed as skill folders:
   ```sh
   git clone --filter=blob:none --sparse https://github.com/anthropics/skills /tmp/anthropic-skills
   git -C /tmp/anthropic-skills sparse-checkout set $(sed 's|^|skills/|' configs/skills/anthropic-skills.txt | tr '\n' ' ')
   while read -r skill; do
     cp -R "/tmp/anthropic-skills/skills/$skill" ~/.agents/skills/
   done < configs/skills/anthropic-skills.txt
   rm -rf /tmp/anthropic-skills
   ```
8. **Verify** — open Zed, type `/` in the agent panel, confirm skills appear. Optional CLI sanity checks:
   ```sh
   claude plugin list
   readlink ~/.claude/skills
   ls ~/.agents/skills
   ls ~/.claude/agents
   ```

## Initial population (one-off, this branch)

These commands run once on the author's current Mac to seed the repo into the state the install flow expects. They do not go in the readme.

| Step | Command |
|---|---|
| Generate `claude-plugins.txt` | `jq -r '.enabledPlugins \| to_entries[] \| select(.value==true) \| .key' ~/.claude/settings.json > configs/skills/claude-plugins.txt`, then append `firebase@claude-plugins-official` manually |
| Write `anthropic-skills.txt` | Hand-author the 16 selected names |
| Unpack `~/Downloads/*.skill` into `bundles/` | `for f in ~/Downloads/*.skill; do unzip -q "$f" -d configs/skills/bundles/; done` |
| Copy custom agent | `cp ~/.claude/agents/code-challenge-reviewer.md configs/skills/agents/` |
| Write `configs/skills/readme.md` | Short — explains the layout, points at the main readme for install steps |
| Edit main `readme.md` | Insert the new "Agent Skills" section after the Zed section |

## Lifecycle — when the author changes their setup later

| Change | Action |
|---|---|
| Enable a new plugin | `echo "<name>@<marketplace>" >> configs/skills/claude-plugins.txt`, commit |
| Author a new local skill | `cp -R ~/.agents/skills/<name> configs/skills/bundles/`, commit |
| Add a registry skill | `echo "<name>" >> configs/skills/anthropic-skills.txt`, commit |
| New `.skill` zip from Downloads | `unzip -q ~/Downloads/<name>.skill -d configs/skills/bundles/`, commit |

## Out of scope (acknowledged, deliberately skipped)

| Case | Why skipped |
|---|---|
| `~/.claude/skills/` already exists as a real directory | `ln -sfn` overwrites it; documented in install step 5. Solving cleanly would need interactive prompts, out of scope for an installfest. |
| Plugin marketplace unreachable | `claude plugin install` surfaces the error; user retries. |
| Anthropic restructures the registry path | `sparse-checkout` will fail loudly; readme gets updated then. |
| Vendored skill drifts from upstream | Manual `git diff` workflow; vendoring means we own the snapshot. |
| Uninstall / rollback | One-liner per concern if needed; not worth scripting. |

## Verification of the design itself

After implementation, the design is considered validated when:

1. A pristine `~/.agents/skills/` and `~/.claude/skills/` symlink can be reconstructed from a fresh clone of the repo using only the documented install steps.
2. `claude plugin list` enumerates every line of `claude-plugins.txt`.
3. Zed's agent slash-command menu lists all 5 vendored + 16 registry skills.
4. The author's `code-challenge-reviewer` subagent is invocable in Claude Code.
