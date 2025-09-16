# 💻 macOS Installfest

## Pre-install

1. Identify which version of OSX you're using - ideally you should have Ventura or newer (13.3.x)
2. Ensure that you've uninstalled any antivirus software you may have, as it can prevent some of the tools from installing properly

## Install Xcode Command Line Tools

Xcode is a large suite of software development tools and libraries from Apple.

The Xcode Command Line Tools are part of Xcode. Installation of many common Unix-based tools requires the [GCC compiler](https://en.wikipedia.org/wiki/GNU_Compiler_Collection).The Xcode Command Line Tools include a GCC compiler.

- Open terminal an type

  ```sh
  xcode-select --install
  ```

- You'll see a panel that asks you to install Xcode Command Line Tools.
- Click 'Install' to begin the download and installation process.

## Terminal

1. Install [iTerm2](https://www.iterm2.com/downloads.html)
2. Set the font size to be **14pt**
   - Press <kbd>⌘</kbd> + <kbd>,</kbd>
   - Navigate to **Profiles** > **Text** > **Font**
   - Increase the font size

## Text editor

### Zed

[Zed](https://zed.dev/) Zed is a next-generation code editor designed for
high-performance collaboration with humans and AI, written in Rust 🦀.

1. Download Zed
2. Move the app from downloads folder to application folder
3. Open Zed
4. Open the settings with <kbd>⌘</kbd> + <kbd>,</kbd>
5. Copy and paste the contents of this [`settings.json`](./configs/zed/settings.json) file into the settings
6. Install the CLI integration by press `Zed > Install CLI Integration`

### VS Code

[Visual Studio](https://code.visualstudio.com/Download) Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js

1. Download Visual Studio
2. Move the app from downloads folder to application folder
3. Open Visual studio
4. Install CLI integration
   - Press <kbd>⌘</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>
   - Type `Shell Command: Install 'code' command in PATH` and press <kbd>Enter</kbd>
5. Turn on **Settings sync**

   ![](https://code.visualstudio.com/assets/docs/editor/settings-sync/turn-on-sync.png)

## Terminal theme

1. Create file called `one-dark.itermcolors` on the `~/Desktop` and open it

   ```sh
   zed  ~/Desktop/one-dark.itermcolors
   ```

2. Copy and paste [**One Dark theme** code](https://raw.githubusercontent.com/one-dark/iterm-one-dark-theme/master/One%20Dark.itermcolors) into the file
3. Set the theme
   - Press <kbd>⌘</kbd> + <kbd>,</kbd>
   - Navigate to **Profiles** > **Colors** > **Color presets...**
   - Select **one-dark**

## Homebrew Package Manager

Homebrew is a package manager for ~~macOS~~ **Linux**.

### What are packages?

Packages are bundles of source code distributed by developers of software, which can be compiled and installed on your machine.

### Install

1. The package manager allows us to install and update software (like Ruby, Git, MongoDB, etc) from the command line:
2. Open [http://brew.sh/](http://brew.sh/), scroll down to Install Homebrew and copy+paste the command into the terminal.
3. Ensure that Homebrew is raring to brew and fix any issues: `brew doctor`
4. Update Homebrew: `brew update`

(**Note**: the absolute paths will not be used after the next step, but might not be needed if they already have `/usr/local/bin` in their \$PATH)

## Fish Shell

1. Install Fish shell

   ```sh
   brew install fish
   ```

2. Add the shell to `/etc/shells` with

   ```sh
    echo $(which fish) | sudo tee -a /etc/shells
   ```

3. Change the default shell to Fish

   ```sh
    chsh -s $(which fish)
   ```

4. Configure iTerm to use Fish shell
   - Open iTerm
   - Press <kbd>⌘</kbd> + <kbd>,</kbd>
   - Navigate to **Profiles** > **General** > **Command**
   - Select **Command** `Login Shell`
   - Check `Load integration automatically`

### Install [Fisher](https://github.com/jorgebucaran/fisher) plugin manager

Run the following command to install Fisher:

```sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

### Install [Bass](https://github.com/edc/bass) plugin

Bass makes it easy to use utilities written for Bash in fish shell.

```sh
fisher install edc/bass
```

### Install [onedark-fish](https://github.com/rkbk60/onedark-fish) theme

```sh
fisher rkbk60/onedark-fish
```

### Configure Fish shell

1. Create a file called `config.fish` in the `~/.config/fish` directory

   ```sh
    zed ~/.config/fish/config.fish
   ```

2. Add the following to the file

   ```sh
   if status is-interactive
      # Commands to run in interactive sessions can go here
      fish_add_path /opt/homebrew/bin
      set_onedark
   end

   # Homebrew
   export HOMEBREW_PREFIX="/opt/homebrew"

   # set editor
   export EDITOR='zed -w -n'
   export PAGER='less -f'
   ```

## Install [Starship 🚀](https://starship.rs/)

1. Type

   ```sh
   brew install starship
   ```

2. Add following to `~/.config/fish/config.fish`

   ```fish
    if status is-interactive
        # ... other commands
        starship init fish | source
    end
   ```

3. To get started configuring starship, create the following file:`~/.config/starship.toml`

   ```toml
   # Don't print a new line at the start of the prompt
   add_newline = false

   # Disable the package module, hiding it from the prompt completely
   [package]
   format = "via [🎁 $version](208 bold) "

   [git_branch]
   symbol = "🌱 "

   [nodejs]
   format = "via [🤖 $version](bold green) "

   [directory]
   truncation_length = 8
   truncation_symbol = "…/"

   [docker_context]
   format = "via [🐋 $context](blue bold)"

   [kotlin]
   symbol = "🅺 "

   [kubernetes]
   format = 'on [🐳 $context \($namespace\)](bold green) '
   disabled = false

   [rust]
   format = "via [⚙️ $version](red bold)"

   [sudo]
   style = "bold green"
   symbol = "👩‍💻 "
   disabled = false

   [terraform]
   format = "[🏎💨 $workspace]($style) "
   ```

## Install [Bat 🦇](https://github.com/sharkdp/bat)

A cat(1) clone with syntax highlighting and Git integration.

1. Type
   ```sh
   brew install bat
   ```

## Install `pyenv` Python Version Manager

[pyenv](https://github.com/pyenv/pyenv) lets you easily switch between multiple versions of Python.

1. Install

   ```sh
   brew install pyenv
   brew install pyenv-virtualenv
   ```

2. Set up your shell environment for Pyenv, run this
   ```sh
   set -Ux PYENV_ROOT $HOME/.pyenv
   fish_add_path $PYENV_ROOT/bin
   ```
3. Set up shell environment for Pyenv in `~/.config/fish/config.fish`

   ```sh
    # Load pyenv
    pyenv init - | source
    alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
   ```

4. Restart the shell
   ```sh
   exec "$SHELL"
   ```

## Install Python

> Check the latest [python](https://www.python.org/downloads/) version and replace the semver number

1. Install
   ```sh
   pyenv install 3.11.1
   ```
2. Set the global version
   ```sh
   pyenv global 3.11.1
   ```
3. Python doesn't ship with the most up to date version of package manager pip, so upgrade pip
   ```sh
   pip install -upgrade pip
   ```

## [NVM](https://github.com/nvm-sh/nvm) Node Version Manager

### Install

1. Open a terminal window and type:

   > Check the latest [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating)

   ```sh
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
   ```

2. Type `source ~/.nvmrc` to include the new folders to the current `$PATH`

### Deeper shell integration

> Read more [here](https://github.com/nvm-sh/nvm?tab=readme-ov-file#deeper-shell-integration)

1. Create the following fish functions

```sh
# ~/.config/fish/functions/nvm.fish
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# ~/.config/fish/functions/nvm_find_nvmrc.fish
function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

# ~/.config/fish/functions/load_nvm.fish
function load_nvm --on-variable="PWD"
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install (cat $nvmrc_path)
    else if test "$nvmrc_node_version" != "$node_version"
      nvm use $nvmrc_node_version
    end
  else if test "$node_version" != "$default_node_version"
    echo "Reverting to default Node version"
    nvm use default
  end
end
```

2. Invoke on `~/.config/fish/config.fish` by

```fish
if status is-interactive
    # ... other commands
    load_nvm > /dev/stderr
end
```

### Using NVM

3. Now that nvm is installed, we want to list the available versions, type:

   ```sh
   nvm ls-remote
   ```

   - And you will be shown a list of all the available versions of node

4. Install the latest version of node and the current **Long term support** (_LTS_)
   ```sh
   nvm install node
   nvm install --lts
   ```
5. Check that Node is installed, type

   ```sh
   node --version
   ```

   - You should see the last version number that you've installed

6. To use `nvm use` automatically in a directory with a `.nvmrc` file add

## Install PNPM

Since v16.13, Node.js is shipping [Corepack](https://nodejs.org/api/corepack.html) for managing package managers.

1. Enable corepack

   ```sh
   corepack enable
   ```

2. Install pnpm

   ```sh
   corepack prepare pnpm@latest --activate
   ```

3. Configure PNPM to work globally
   ```sh
   pnpm setup
   ```
4. Add the following to `~/.config/fish/config.fish`

   ```fish
   # pnpm
   set -gx PNPM_HOME "/Users/pataruco/Library/pnpm"
   if not string match -q -- $PNPM_HOME $PATH
      set -gx PATH "$PNPM_HOME" $PATH
   end
   # pnpm end
   ```

## Biome

Install Biome

```sh
brew install biome
```

## Prettier

### Create `.prettierrc.json` file

- Let define some rules for `prettier`

```sh
zed ~/.prettierrc
```

- Copy and paste this [configuration](./configs/prettier/prettierrc.json)

- Save file <kbd>command </kbd> + <kbd>S</kbd>.

### Install `prettier` packages

Install the following **prettier** packages

```sh
pnpm --global add prettier
```

## Install Rust 🦀

Just run this

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Install Git

Git is the version control system that we will use throughout the course. It is one of the most powerful tools you will use as a developer.

1. This ensures we can upgrade Git more easily:
   `brew install git`
2. Restart the terminal
3. Ensure you're not using "Apple Git" from the path `/usr/bin/git` by checking `which git` and `git --version`
4. Configure your name and email address for commits (be sure to use the email address you have registered with Github):

```sh
 git config --global user.name "Your Name"
 git config --global user.email "you@example.com"
```

### Git Multiple identities

Instead to have a global user email, we can set a different identity per repo.

1. Reset global user email
   ```sh
   git config --global --unset-all user.email
   ```
2. Set local config per repo

   ```sh
   git config --global --add user.useConfigOnly true
   ```

3. Add email to your GitHub account [emails](https://github.com/settings/emails)
4. Before the first commit on repo

   ```sh
   git config --local --add user.email mail@example.com
   ```

### Git set default branch to be `main`

```sh
git config --global init.defaultBranch main
```

## `git show` plugin [(Delta)](https://github.com/dandavison/delta)

> Delta provides language syntax-highlighting, within-line insertion/deletion detection, and restructured diff output for git on the command line.

1. Install via brew
   ```sh
   brew install git-delta
   ```
2. Configure git to use delta adding the following to `.gitconfig`:

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

## `git-clean`

> Based on # Git Remove tracking branches no longer on remotE https://stackoverflow.com/a/33548037/4842303

1. Create a fish file function

   ```sh
   zed ~/.config/fish/functions/git_clean.fish
   ```

2. Add the following function

   ```sh
   function git-clean
    git fetch -p
    for branch in (git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
      git branch -D $branch
    end
   end
   ```

## Global `.gitignore`

There are a few files that we don't want Git to track. We can specifically ignore them by adding the files to a global `.gitignore` file.

### .DS_Store files

`.DS_Store` files are used by Mac OS X to store folder specific metadata information. They are different for every mac, it means that they often cause conflicts in version controlled folders.

Since we never want to track .DS_Store files, we can make a global `.gitignore` file, and tell git to use it for all repositories:

```sh
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

### public/uploads/, node_modules & bower_components

In the same way, we want to never track the contents of our uploads folder in Rails (which usually contain images or media that we have uploaded during testing) or our node_modules or bower_components.

```sh
echo "/public/uploads/\nnode_modules/\nbower_components/" >> ~/.gitignore_global
```

### autocorrect

Enable auto-correct the suggested command will run after a short delay to give you the chance to cancel the command if it is not what you intended

```sh
git config --global help.autocorrect 20
```

## Configure SSH keys on Github

GitHub is a web-based Git repository hosting service. It allows us to keep a remote version of our version-controlled projects. When we push and pull from Git, we don't want to always have to login to verify who we are. Therefore, what we can do is generate and use something called an SSH key. SSH keys are a way to identify trusted computers, without involving passwords.

1. First, we need to check for existing SSH keys on your computer. Open up your Terminal and type:
   ```sh
   ls -al ~/.ssh
   ```
   Check the directory listing to see if you have files named either **id_rsa.pub** or **id_dsa.pub**. If you have either of those files you can skip to the step 'add your SSH key to Github'.
2. Generate a new SSH key
   ```sh
    ssh-keygen -t rsa -C "your_email@example.com"
   ```
3. You'll be prompted for a file to save the key, and a passphrase. Press enter for both steps (default name, and no passphrase)
4. Then add your new key to the ssh-agent:
   ```sh
    ssh-add ~/.ssh/id_rsa
   ```
5. Add your SSH key to GitHub by logging into Github, visiting **account settings** and clicking **SSH keys**. Click **Add SSH key**
6. Copy your key to the clipboard with the terminal command:
   ```sh
    pbcopy < ~/.ssh/id_rsa.pub
   ```
7. On Github, create a descriptive title for your key, an paste into the `key` field - _do not add or remove and characters or whitespace to the key_
8. Click `Add key` and check everything works in the terminal by typing:
   ```sh
    ssh -T git@github.com
   ```

## Configure signed commits

1. Copy your key to the clipboard with the terminal command:
   ```sh
    pbcopy < ~/.ssh/id_rsa.pub
   ```
2. On Github, create a descriptive title for your key, an paste into the `key` field - _do not add or remove and characters or whitespace to the key_
3. Select the type of key to be `Signing Key`.
4. Click `Add key`
5. Configure Git to use SSH to sign commits and tags
   ```sh
   git config --global commit.gpgsign true
   git config --global gpg.format ssh
   ```
6. To set your SSH signing key in Git with the path to the public key you'd like to use.
   ```sh
   git config --global user.signingkey ~/.ssh/id_rsa.pub
   ```

## Speed up your cursor

During the course, we will be doing a lot of navigating using our keyboards. By default, the speed of the curson on a Mac is a little too slow. Let's increase the speed of the cursor by going to:

```
System Preferences > Keyboard
```

Move both up to maximum.
