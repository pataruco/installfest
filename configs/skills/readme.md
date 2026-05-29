# Agent Skills bundle

Skills installed here work in both Zed and Claude Code (Zed reads `~/.agents/skills/`, Claude Code reads `~/.claude/skills/`; the main install symlinks the second to the first).

## Layout

| Path                   | Contents                                                                                                                                      |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `claude-plugins.txt`   | One `<plugin>@<marketplace>` per line. Driven into `claude plugin install` by an `xargs` loop.                                                |
| `anthropic-skills.txt` | One skill name per line. Names match folders under `skills/` in [`anthropics/skills`](https://github.com/anthropics/skills).                  |
| `bundles/<name>/`      | Hand-curated skill bundles vendored from `.skill` zip archives. Each contains `SKILL.md` and optionally `scripts/`, `references/`, `assets/`. |
| `agents/<name>.md`     | Custom Claude Code subagents.                                                                                                                 |

## Install

See the **Agent Skills** section in the main [`readme.md`](../../readme.md) for the install steps. The install:

1. Registers the `accesslint` and `anthropics/skills` plugin marketplaces.
2. Runs `claude plugin install` for every line in `claude-plugins.txt`.
3. Copies the agent files into `~/.claude/agents/`.
4. Creates `~/.agents/skills/` and symlinks `~/.claude/skills/` to it.
5. Copies the `bundles/` into the symlinked target.
6. Sparse-clones the names in `anthropic-skills.txt` from the registry.

## Maintaining this directory

| When                                          | Do                                                                             |
| --------------------------------------------- | ------------------------------------------------------------------------------ |
| You enable a Claude plugin                    | Append `<plugin>@<marketplace>` to `claude-plugins.txt` and commit.            |
| You want a new Anthropic registry skill       | Append the name to `anthropic-skills.txt` and commit.                          |
| You drop a new `.skill` zip in `~/Downloads/` | Run `unzip -q ~/Downloads/<name>.skill -d configs/skills/bundles/` and commit. |
| You author a new local skill                  | Run `cp -R ~/.agents/skills/<name> configs/skills/bundles/` and commit.        |
