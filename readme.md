# 💻 macOS installfest

Set up a new Mac for development: Ghostty and tmux as the terminal, Fish with Starship as the shell, Zed as the editor, Git and GitHub, Node, Python and Rust, and Claude Code and Delta with shared agent skills.

Follow the sections in order. Later steps use tools installed earlier. Where a tool has a config file, this repo ships it under [`configs/`](./configs) and the steps copy it into place, so clone this repo first and run the commands from its root.

## Before you start

- Check your macOS version: Apple menu > **About This Mac**. You need Ventura (13.3) or newer.
- Uninstall any antivirus software. It can stop some of the installers from working.

## Xcode Command Line Tools

Apple's compilers and build tools. Homebrew and many of the tools below need them.

1. Open **Terminal** (in `/Applications/Utilities`) and run

   ```sh
   xcode-select --install
   ```

2. Click **Install** in the dialog that appears and wait for the download to finish.

## Homebrew

[Homebrew](https://brew.sh/) installs and updates command-line tools and apps. Almost every step below uses it.

1. Open [brew.sh](https://brew.sh/) and run the install command shown there. It is not copied here because it changes from time to time.
2. Run the "Next steps" commands the installer prints at the end. They add Homebrew to your `PATH`.
3. Check the install

   ```sh
   brew doctor
   ```

   You should see `Your system is ready to brew.`

## Git

macOS ships an old "Apple Git" with the Xcode tools. Install Homebrew's Git now so every `git` command in this guide, starting with the next section, uses the newer one.

1. Install Git

   ```sh
   brew install git
   ```

2. Open a new terminal window and check which Git you are using

   ```sh
   which git
   git --version
   ```

   `which git` should print `/opt/homebrew/bin/git`, not `/usr/bin/git`.

## Terminal: Ghostty

[Ghostty](https://ghostty.org/) has no preferences window. Everything lives in `~/.config/ghostty/config`.

1. Install Ghostty

   ```sh
   brew install --cask ghostty
   ```

2. Copy the config and the One Dark theme from this repo

   ```sh
   mkdir -p ~/.config/ghostty/themes
   cp configs/ghostty/config ~/.config/ghostty/config
   cp configs/ghostty/themes/one-dark ~/.config/ghostty/themes/one-dark
   ```

   The config sets Monaco 14pt, bold text in bright colours and the One Dark theme. Ghostty's built-in `Atom One Dark` uses different colours, so the repo ships its own `one-dark` file, based on the [One Dark iTerm preset](https://github.com/one-dark/iterm-one-dark-theme) plus the colours that [`set_onedark`](#shell-fish-and-starship) applies at every shell start.

3. Do not open Ghostty yet. The config starts tmux in every new window, and tmux is installed in the next section.

### What the config gives you

- <kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>,</kbd> reloads the config after you edit it.
- <kbd>⌘</kbd> + <kbd>`</kbd> toggles a drop-down quick terminal from any app. The first time, macOS asks you to allow Ghostty under **System Settings > Privacy & Security > Accessibility**.
- `ssh` works on hosts that do not know `xterm-ghostty`. Ghostty installs its terminfo on the remote host, or falls back to `xterm-256color` (`shell-integration-features = ssh-env,ssh-terminfo`).

## tmux

Ghostty has no status bar ([ghostty#2421](https://github.com/ghostty-org/ghostty/discussions/2421)). [tmux](https://github.com/tmux/tmux/wiki) draws one inside the terminal with CPU, memory and network meters, and keeps your sessions alive across reboots.

1. Install tmux and the tools the network meter needs

   ```sh
   brew install tmux gawk coreutils
   ```

2. Install [TPM](https://github.com/tmux-plugins/tpm), the tmux plugin manager. It goes under `~/.config/tmux/` because that is where the config lives.

   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   ```

3. Copy the config from this repo

   ```sh
   mkdir -p ~/.config/tmux
   cp configs/tmux/tmux.conf ~/.config/tmux/tmux.conf
   ```

4. Open Ghostty. It starts a tmux session called `main`.
5. Install the plugins: press <kbd>Ctrl</kbd> + <kbd>b</kbd>, then <kbd>I</kbd> (capital i).

   The status line at the top should now show `CPU`, `MEM` and `↓ ↑` network throughput.

### What the config gives you

- **Status line** with [`tmux-cpu`](https://github.com/tmux-plugins/tmux-cpu) and [`tmux-network-bandwidth`](https://github.com/xamut/tmux-network-bandwidth), in One Dark colours.
- **Sessions survive reboots.** [`tmux-resurrect`](https://github.com/tmux-plugins/tmux-resurrect) and [`tmux-continuum`](https://github.com/tmux-plugins/tmux-continuum) save every 15 minutes and restore when tmux starts. Save or restore by hand with <kbd>Ctrl</kbd> + <kbd>b</kbd>, then <kbd>Ctrl</kbd> + <kbd>s</kbd> or <kbd>Ctrl</kbd> + <kbd>r</kbd>.
- **Clipboard.** [`tmux-yank`](https://github.com/tmux-plugins/tmux-yank) copies a mouse selection when you release the button, and <kbd>y</kbd> copies in copy mode.
- **Windows and panes are numbered from 1** and renumber when one closes.
- <kbd>⌘</kbd> + <kbd>K</kbd> clears the pane and its scrollback. Ghostty sends it as <kbd>Ctrl</kbd> + <kbd>L</kbd>, which the tmux config binds.
- <kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>A</kbd> copies the output of the last command to the clipboard. tmux finds the start from the prompt marks Fish emits and the end by stepping over the 2-line Starship prompt. If you change the prompt height, adjust the two `cursor-up` steps in `tmux.conf`.
- **Links.** Hold <kbd>⌘</kbd> + <kbd>⇧</kbd> while hovering a URL and click it. <kbd>⇧</kbd> is how Ghostty bypasses tmux's mouse handling for one click ([ghostty#1040](https://github.com/ghostty-org/ghostty/issues/1040)). Outside tmux it is <kbd>⌘</kbd> + click.

Other keys, all after <kbd>Ctrl</kbd> + <kbd>b</kbd>:

| Key                       | Does                                                     |
| ------------------------- | -------------------------------------------------------- |
| <kbd>c</kbd>              | New window                                               |
| <kbd>n</kbd> <kbd>p</kbd> | Next or previous window                                  |
| <kbd>%</kbd>              | Split left and right                                     |
| <kbd>"</kbd>              | Split top and bottom                                     |
| <kbd>d</kbd>              | Detach. The session keeps running; `tmux attach` returns |
| <kbd>U</kbd>              | Update plugins                                           |

To get a plain Fish shell instead of tmux, comment out the `command = …` line in `~/.config/ghostty/config`.

## Shell: Fish and Starship

[Fish](https://fishshell.com/) is the shell, with the One Dark colours, the [Starship](https://starship.rs/) prompt, fuzzy search with [fzf](https://github.com/junegunn/fzf), a smarter `cd` with [zoxide](https://github.com/ajeetdsouza/zoxide), and Node versions with [fnm](https://github.com/Schniz/fnm). Everything is installed first, then one config file turns it all on.

1. Install Fish and the tools the config uses

   ```sh
   brew install fish starship fzf fd bat zoxide fnm
   ```

   - **fd** is a fast `find` that respects `.gitignore`. fzf uses it to list files.
   - **bat** is `cat` with syntax highlighting. fzf uses it for file previews.

2. Make Fish the default shell

   ```sh
   echo $(which fish) | sudo tee -a /etc/shells
   chsh -s $(which fish)
   ```

3. Start Fish, then install the [Fisher](https://github.com/jorgebucaran/fisher) plugin manager and the [onedark-fish](https://github.com/rkbk60/onedark-fish) theme

   ```sh
   fish
   ```

   ```fish
   curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
   fisher install rkbk60/onedark-fish
   ```

4. Copy the Fish, Starship and `git-clean` configs from this repo

   ```sh
   mkdir -p ~/.config/fish/functions
   cp configs/fish/config.fish ~/.config/fish/config.fish
   cp configs/fish/functions/git-clean.fish ~/.config/fish/functions/git-clean.fish
   cp configs/starship/starship.toml ~/.config/starship.toml
   ```

5. Restart tmux so it picks up the new default shell, then open a new Ghostty window

   ```sh
   tmux kill-server
   ```

   You should see the Starship prompt: the directory, then `❯` on its own line.

### What the config gives you

[`config.fish`](./configs/fish/config.fish):

- Homebrew and `~/.local/bin` on the `PATH`.
- `set_onedark` repaints the terminal palette at every start.
- `EDITOR` is `zed -w -n`, so Git and other tools open files in Zed and wait for you to close them.
- fnm is loaded **outside** the `if status is-interactive` block. Scripts, editors and `pnpm` shims run non-interactive shells and need `node` on their `PATH` too. `--use-on-cd` switches Node version when you enter a directory with a `.nvmrc` or `.node-version`; `--version-file-strategy=recursive` also finds one in a parent directory.

Fuzzy search and `cd`:

| Key or command                    | Does                                                   |
| --------------------------------- | ------------------------------------------------------ |
| <kbd>Ctrl</kbd> + <kbd>R</kbd>    | Fuzzy search the command history                       |
| <kbd>Ctrl</kbd> + <kbd>T</kbd>    | Fuzzy pick a file, with a preview, and insert its path |
| <kbd>Shift</kbd> + <kbd>Tab</kbd> | Fuzzy completion for the word at the cursor            |
| `z inst`                          | Jump to the most used directory matching `inst`        |
| `zi`                              | Pick a directory from an interactive list              |

fzf's <kbd>Option</kbd> + <kbd>C</kbd> binding is turned off because <kbd>Option</kbd> types accented characters on macOS. Use `zi` instead.

[`starship.toml`](./configs/starship/starship.toml), on top of the per-language symbols:

- **Right side of the prompt**: how long the last command took (when over 2 s), `💥 <code>` in red after a failed command, battery when it is at 10% or less, and the time. Commands that run longer than 45 s send a desktop notification.
- **Git**: `⇡2` ahead, `⇣1` behind, `⇕⇡2⇣1` diverged. The repository root in the path is bold cyan.
- **gcloud** shows the active project instead of the account e-mail.
- **sudo** is off. Its credential check added about 14 ms to every prompt.

## Editor: Zed

[Zed](https://zed.dev/) is a fast editor with built-in collaboration and AI agents.

1. Install Zed

   ```sh
   brew install --cask zed
   ```

2. Copy the settings from this repo

   ```sh
   mkdir -p ~/.config/zed
   cp configs/zed/settings.json ~/.config/zed/settings.json
   ```

3. Open Zed and choose **Zed > Install CLI**. This adds the `zed` command that `EDITOR` uses.

## Git and GitHub

Git itself was installed after [Homebrew](#git). This section configures it and connects it to GitHub.

### Tell Git who you are

Use the name and e-mail registered with your GitHub account.

```sh
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

To use a different e-mail per repository instead, leave the global e-mail unset and make Git require a local one:

1. Remove any global e-mail and require a per-repo identity

   ```sh
   git config --global --unset-all user.email
   git config --global --add user.useConfigOnly true
   ```

2. Add each e-mail to your [GitHub account](https://github.com/settings/emails).
3. Set the e-mail in each repository before its first commit

   ```sh
   git config --local --add user.email mail@example.com
   ```

### Git defaults

```sh
# New repositories start on `main`
git config --global init.defaultBranch main

# Run a mistyped command after a 2 second delay, with time to cancel
git config --global help.autocorrect 20

# Never track macOS folder metadata or dependencies, in any repository
printf '.DS_Store\nnode_modules/\n' >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

### Better diffs with Delta

[Delta](https://github.com/dandavison/delta) adds syntax highlighting, side-by-side view and within-line change detection to `git diff`, `git show` and `git log -p`.

1. Install Delta

   ```sh
   brew install git-delta
   ```

2. Add the following to `~/.gitconfig`

   ```toml
   [core]
       pager = delta

   [interactive]
       diffFilter = delta --color-only

   [delta]
       features = side-by-side line-numbers decorations
       whitespace-error-style = 22 reverse

   [delta "decorations"]
       commit-decoration-style = bold yellow box ul
       file-style = bold yellow ul
       file-decoration-style = none
   ```

### Delete stale branches with `git-clean`

`git-clean` deletes every local branch whose remote branch has been deleted, for example after a pull request is merged. It was installed with the Fish config in the [Shell](#shell-fish-and-starship) section. Run it from inside a repository:

```sh
git-clean
```

### SSH key for GitHub

An SSH key lets you push and pull without typing a password.

1. Check whether you already have a key

   ```sh
   ls -al ~/.ssh
   ```

   If you see `id_rsa.pub`, skip to step 4.

2. Create a key. Press <kbd>Enter</kbd> at both prompts to accept the default file name and no passphrase.

   ```sh
   ssh-keygen -t rsa -C "your_email@example.com"
   ```

3. Add it to the SSH agent

   ```sh
   ssh-add ~/.ssh/id_rsa
   ```

4. Copy the public key to the clipboard

   ```sh
   pbcopy < ~/.ssh/id_rsa.pub
   ```

5. Add it to GitHub: open [SSH and GPG keys](https://github.com/settings/keys), click **New SSH key**, give it a title, paste the key and click **Add SSH key**. Leave **Key type** as **Authentication Key**.
6. Check that it works

   ```sh
   ssh -T git@github.com
   ```

   You should see `Hi <username>! You've successfully authenticated`.

### Sign commits with the same key

GitHub shows a **Verified** badge on signed commits. The same SSH key can sign them, but GitHub needs it added a second time as a signing key.

1. Copy the public key again

   ```sh
   pbcopy < ~/.ssh/id_rsa.pub
   ```

2. On [SSH and GPG keys](https://github.com/settings/keys), click **New SSH key**, set **Key type** to **Signing Key**, paste the key and click **Add SSH key**.
3. Tell Git to sign every commit and tag with it

   ```sh
   git config --global commit.gpgsign true
   git config --global gpg.format ssh
   git config --global user.signingkey ~/.ssh/id_rsa.pub
   ```

### GitHub CLI

[`gh`](https://cli.github.com/) works with pull requests, issues and releases from the terminal.

```sh
brew install gh
gh auth login
```

## Node

fnm was installed in the [Shell](#shell-fish-and-starship) section. It reads the same `.nvmrc` and `.node-version` files as nvm and switches version in a few milliseconds.

1. Install the current long-term support (LTS) release and the latest release, and make LTS the default

   ```sh
   fnm install --lts
   fnm install latest
   fnm default lts-latest
   ```

2. Check

   ```sh
   node --version
   fnm list
   ```

In a project with a `.nvmrc`, fnm switches to that version when you `cd` in. If the version is not installed yet, `fnm install` with no arguments installs it.

### pnpm

[pnpm](https://pnpm.io/) is a fast, disk-efficient package manager.

1. Install pnpm. The installer appends a `PNPM_HOME` block to `~/.config/fish/config.fish`.

   ```sh
   curl -fsSL https://get.pnpm.io/install.sh | sh -
   ```

2. Open a new shell, then check

   ```sh
   pnpm --version
   ```

To update later, run `pnpm self-update`.

### Formatters: Prettier and Biome

1. Install Prettier globally and copy its config from this repo

   ```sh
   pnpm add --global prettier@latest
   cp configs/prettier/prettierrc.json ~/.prettierrc.json
   ```

2. Install [Biome](https://biomejs.dev/)

   ```sh
   brew install biome
   ```

## Python

[uv](https://docs.astral.sh/uv/) installs Python versions and manages packages and virtual environments.

1. Install uv

   ```sh
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. Install the Python versions you need and pick a default. Check [python.org](https://www.python.org/downloads/) for the current numbers.

   ```sh
   uv python install 3.14 3.13
   uv python pin 3.14
   ```

## Rust 🦀

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## AI: Claude Code, Delta and agent skills

### Claude Code

1. Install [Claude Code](https://code.claude.com/docs/en/quickstart#native-install-recommended)

   ```sh
   curl -fsSL https://claude.ai/install.sh | bash
   ```

2. Log in

   ```sh
   claude login
   ```

### Delta

[Delta](https://delta.dev/) is Zed's collaborative agent workspace. An agent works in a separate checkout of your repository, and you review, comment on and pull in the result; teammates can join the thread. It needs macOS 13 or later on Apple Silicon and a Zed account.

1. Sign in or create an account on the [Zed dashboard](https://dashboard.zed.dev/delta-beta) and accept the Delta Early Access Agreement.
2. Install the app and the `delta` command

   ```sh
   curl -fsSL https://delta.dev/install.sh -o delta-install.sh
   sh delta-install.sh
   rm delta-install.sh
   ```

   The installer asks before downloading. It puts the app in `~/Applications/Delta.app` and links the command to `~/.local/bin/delta`. If it offers to change your shell config, say no: the Fish config from the [Shell](#shell-fish-and-starship) section already has `~/.local/bin` on the `PATH`.

3. Open Delta and follow the **Welcome to Delta** steps to sign in and connect a model

   ```sh
   delta
   ```

4. Connect it to Claude Code, so a Claude Code session can be shared as a Delta thread with `/delta share`, or join one with `/delta join`

   ```sh
   claude plugin marketplace add zed-industries/delta-claude
   claude plugin install delta@zed-industries
   ```

To update later, run `delta update`. See the [Delta docs](https://delta.dev/docs) for the rest.

### Agent skills

[Agent skills](https://zed.dev/docs/ai/skills) are instruction packages that the AI agent loads when a task matches. Zed and Delta read them from `~/.agents/skills/` and Claude Code from `~/.claude/skills/`. These steps install one set at `~/.agents/skills/` and point `~/.claude/skills/` at it, so all three tools see the same skills. The files are described in [`configs/skills/readme.md`](./configs/skills/readme.md).

1. Register the two extra plugin marketplaces

   ```sh
   claude plugin marketplace add accesslint/claude-marketplace
   claude plugin marketplace add anthropics/skills
   ```

2. Install the Claude Code plugins listed in [`claude-plugins.txt`](./configs/skills/claude-plugins.txt)

   ```sh
   xargs -L1 claude plugin install < configs/skills/claude-plugins.txt
   ```

   The list includes `firebase@claude-plugins-official`. Disable it in Claude if you do not need it.

3. Install the custom subagent

   ```sh
   mkdir -p ~/.claude/agents
   cp configs/skills/agents/code-challenge-reviewer.md ~/.claude/agents/
   ```

4. Create the shared skills directory and point `~/.claude/skills/` at it

   ```sh
   mkdir -p ~/.agents/skills
   ln -sfn ~/.agents/skills ~/.claude/skills
   ```

   `ln -sfn` replaces an existing `~/.claude/skills/`. If you already have skills there, back them up first.

5. Copy the skill bundles from this repo

   ```sh
   cp -R configs/skills/bundles/* ~/.agents/skills/
   ```

6. Fetch the skills listed in [`anthropic-skills.txt`](./configs/skills/anthropic-skills.txt) from the [Anthropic skills registry](https://github.com/anthropics/skills)

   ```sh
   git clone --filter=blob:none --sparse https://github.com/anthropics/skills /tmp/anthropic-skills
   git -C /tmp/anthropic-skills sparse-checkout set $(sed 's|^|skills/|' configs/skills/anthropic-skills.txt | tr '\n' ' ')
   while read -r skill; do
     cp -R "/tmp/anthropic-skills/skills/$skill" ~/.agents/skills/
   done < configs/skills/anthropic-skills.txt
   rm -rf /tmp/anthropic-skills
   ```

7. Check. In Zed, type `/` in the agent panel; the installed skills appear in the completion menu. From the terminal:

   ```sh
   claude plugin list
   readlink ~/.claude/skills   # prints the path to ~/.agents/skills
   ls ~/.agents/skills         # lists every installed skill
   ls ~/.claude/agents         # includes code-challenge-reviewer.md
   ```

## macOS: faster key repeat

Holding a key to move the cursor is slow by default. Open **System Settings > Keyboard** and move **Key repeat rate** to **Fast** and **Delay until repeat** to **Short**.
