# 💻 macOS Installfest

## Pre-install

1. Identify which version of OSX you're using - ideally you should have Big Sur or newer (11.14.x)
2. Ensure you've got [Xcode installed](https://apps.apple.com/gb/app/xcode/id497799835)
3. Ensure that you've uninstalled any antivirus software you may have, as it can prevent some of the tools from installing properly

## Terminal

1. Install [iTerm2](https://www.iterm2.com/downloads.html)
2. Set the font size to be **14pt**
   - Press <kbd>⌘</kbd> + <kbd>,</kbd>
   - Navigate to **Profiles** > **Text** > **Font**
   - Increase the font size

## Text editor

[Visual Studio](https://code.visualstudio.com/Download) Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. It comes with built-in support for JavaScript, TypeScript and Node.js

1. Download Visual Studio
2. Move the app from downloads folder to application folder
3. Open Visual studio
4. Turn on **Settings sync**
   ![](https://code.visualstudio.com/assets/docs/editor/settings-sync/turn-on-sync.png)

## Terminal theme

1. Create file called `one-dark.itermcolors` on the `~/Desktop` and open it

   ```sh
   code  ~/Desktop/one-dark.itermcolors
   ```

2. Copy and paste [**One Dark theme** code](https://raw.githubusercontent.com/one-dark/iterm-one-dark-theme/master/One%20Dark.itermcolors) into the file
3. Set the theme
   - Press <kbd>⌘</kbd> + <kbd>,</kbd>
   - Navigate to **Profiles** > **Colors** > **Color presets...**
   - Select **one-dark**

## Command Line Tools

Xcode is a large suite of software development tools and libraries from Apple. The Xcode Command Line Tools are part of XCode. Installation of many common Unix-based tools requires the [GCC compiler](https://en.wikipedia.org/wiki/GNU_Compiler_Collection). The Xcode Command Line Tools include a GCC compiler.

1. Run from the command line: `xcode-select --install`
2. Choose `install tools` from the prompt and `agree` to the terms
3. If you recieve a message saying "Can't install the software because it is not currently available from the Software Update server"... it's probably because the command line tools are already installed...
4. Agree to the license by typing `sudo xcodebuild -license`
5. Press enter, then `q`
6. Then on the next prompt, type `agree`

## Homebrew Package Manager

Homebrew is a package manager for ~~OSX~~ **Linux**.

#### What are packages?

Packages are bundles of source code distributed by developers of software, which can be compiled and installed on your machine.

#### Install

1. The package manager allows us to install and update software (like Ruby, Git, MongoDB, etc) from the command line:
2. Open [http://brew.sh/](http://brew.sh/), scroll down to Install Homebrew and copy+paste the command into the terminal.
3. Ensure that Homebrew is raring to brew and fix any issues: `brew doctor`
4. Update Homebrew: `brew update`

(**Note**: the absolute paths will not be used after the next step, but might not be needed if they already have `/usr/local/bin` in their \$PATH)

## Zsh

#### What is a shell?

We will go into a bit more detail about the shell later on in the course but a shell is a very basic user interface for accessing an operating system's services.

#### bash vs zsh

Macs before OSX Catalina came shipped with a shell called 'bash' by default. Bash stands for **'Bourne-again shell'**, referring to its objective as a free replacement for the Bourne shell which was developed by [Steven Bourne](https://en.wikipedia.org/wiki/Stephen_R._Bourne).

### ⚠️ _If you are using Catalina or a greater version skip these steps_ ⚠️

We are going to use another shell called zsh because it has some extra features to make our web-development easier.

The American English pronunciation of Z is "zee", so Z shell rhymes with C shell, which sounds like seashell. zsh was also the login of the original developer Paul Falstad's Yale professor Zhong Shao.

#### Install

1. Type `brew install zsh` Type `0` if the prompt ask you about .zshrc
2. Type `zsh` . You should have a different prompt
3. Type `exit` to return to bash
4. Type `which zsh` to determine where your new shell has installed
5. Type `code /etc/shells` and add `/YOUR/PATH/TO/zsh`. (Lists trusted shells. The chsh command allows users to change their login shell only to shells listed in this file)
6. In a new tab, type `chsh -s /YOUR/PATH/TO/zsh`, then close and reopen your terminal application to This will enable zsh by default.
7. Type `echo $SHELL`. this should return `/YOUR/PATH/TO/zsh`

## Oh-My-Zsh

Oh My Zsh is an open source, community-driven framework for managing your zsh configuration. Here is the link to the [Github](https://github.com/robbyrussell/oh-my-zsh).

The `PATH` environment variable is a colon-delimited list of directories that your shell searches through when you enter a command.

1. Type

   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. Restart the terminal (close and open)

3. Add following to `.zshrc` file to make VSCode the default text editor:

   ```sh
   export EDITOR='code -w -n'
   export PAGER='less -f'
   ```

4. 2. Restart the terminal (close and open) the prompt should be a tilde (**~**), and in colour.

### Increase ZSH history

1. Add following to `.zshrc` file to increase ZSH history:

   ```sh
      # History
      export HISTFILE=~/.zsh_history
      ## Increase history size
      export HISTFILESIZE=1000000000
      export HISTSIZE=1000000000
      ## Immediate append
      setopt INC_APPEND_HISTORY
      export HISTTIMEFORMAT="[%F %T] "
      ## Handling duplicate commands
      setopt EXTENDED_HISTORY
      setopt HIST_FIND_NO_DUPS
      setopt HIST_IGNORE_ALL_DUPS
   ```

## Install [Starship 🚀](https://starship.rs/)

1. Type

   ```sh
   brew install starship
   ```

2. Add following to `.zshrc` to make Starship run on ZSH init

   ```sh
   eval "$(starship init zsh)"
   ```

3. To get started configuring starship, create the following file:`~/.config/starship.toml`

   ```toml
    # Don't print a new line at the start of the prompt
    add_newline = false

    # Replace the "❯" symbol in the prompt with "➜"
    [character]      # The name of the module we are configuring is "character"
    symbol = "➜"     # The "symbol" segment is being set to "➜"

    # Disable the package module, hiding it from the prompt completely
    [package]
    disabled = true

    [git_branch]
    symbol = "🌱 "
   ```

## Install [Bat 🦇](https://github.com/sharkdp/bat)

A cat(1) clone with syntax highlighting and Git integration.

1. Type
   ```sh
   brew install bat
   ```

## Ruby Environment (Rbenv)

A Ruby version manager, is a programme designed to manage multiple installations of Ruby on the same device.

#### Rbenv vs Rvm

There are two main Ruby version managers, Rbenv and rvm. Both have advantages and disadvantages. On this course we are going to be using rvm.

**Note**: If a student does have rvm installed:

```sh
rvm implode
gem uninstall rvm
```

#### Install Rbenv

1. Install rbenv (the Ruby version manager) and ruby-build (the Ruby version builder) from Homebrew:
   ```sh
    brew install ruby-build rbenv
   ```
2. Ensure that rbenv is loaded whenever we open a command line session:

   ```sh
   echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc

   ```

3. Move the rbenv environment higher in the load order:
   ```sh
    echo 'export PATH=$HOME/.rbenv/shims:$PATH' >> ~/.zshrc
   ```
4. Quit the current terminal (Cmd+Q)
5. And then reopen the terminal application, ensuring there are no errors - you should be able to type `rbenv -v` and get a version number.

## Install a version of Ruby with ruby-build

Ruby-build is an rbenv plugin that provides an rbenv install command to compile and install different versions of Ruby on UNIX-like systems.

1. OS X 10.9 comes with Ruby baked in, but it's version is not the latest one. We could upgrade that version of Ruby to a newer one, but what if we needed to run one version of Ruby for one app, and a different version for another?
2. Install Ruby 2.2.3. This is the latest stable version of Ruby:
   `rbenv install 2.2.3`
3. This is required every time we install a new Ruby or install a gem with a binary:
   `rbenv rehash`
4. Set the global Ruby to the one we've just installed, which is a sensible default:
   `rbenv global 2.2.3`
5. Test you have the right version with `ruby -v`

## Install nvm

1. Open a terminal window and type:

   ```sh
   export NVM_DIR="$HOME/.nvm" && (
   git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
   cd "$NVM_DIR"
   git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
   ) && \. "$NVM_DIR/nvm.sh"
   ```

2. Type `source ~/.nvmrc` to include the new folders to the current `$PATH`

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

6. To use `nvm use` automatically in a directory with a `.nvmrc` file add [this script](https://github.com/nvm-sh/nvm#zsh) to `.zshrc`

## Yarn 2

1. Install Yarn

   ```sh
   brew install yarn
   ```

2. Set Yarn to use version 2

   ```sh
   yarn set version berry
   ```

## ESLint

### Create `.eslintrc.json` file

- Let define some rules for `eslint`

  ```sh
  code ~/.eslintrc.json
  ```

- Copy and paste this [text](https://gist.github.com/pataruco/353b75f87ad809dc96b64174b2201f60#file-eslintrc-json) in the file `.eslintrc.json`
- Save file <kbd>command</kbd> + <kbd>S</kbd>.

### Install `eslint` packages

Install the following **eslint** packages

```sh
yarn global add eslint@^7 eslint-plugin-react babel-eslint eslint-config-prettier
```

## Prettier

### Create `.prettierrc.json` file

- Let define some rules for `prettier`

  ```sh
  code ~/.prettierrc
  ```

- Copy and paste this [text](https://gist.github.com/pataruco/353b75f87ad809dc96b64174b2201f60#file-prettierrc-json) in the file `.prettierrc.json`
- Save file <kbd>command </kbd> + <kbd>S</kbd>.

### Install `prettier` packages

Install the following **prettier** packages

```sh
yarn global add prettier
```

## Skip gem rdoc generation

Whenever we install a gem, it also installs a bunch of documentation we probably don't want - the following command allows us to avoid this:

```sh
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
```

## Bundler

Bundler manages Ruby gems per-project/application, and makes it trivial to install all the dependencies for an application:

```sh
gem install bundler
rbenv rehash
```

If you install a gem that includes 'binaries' (or any generally available command line scripts), you need to run `rbenv rehash` so that rbenv can create the necessary shim files, (a shim file ensures there's no threat of incompatibilities between libraries or systems like Bundler and rbenv.)

## Install Wget

We will often download files from the internet in the command line. We can install a tool to help us do that:

```sh
brew install wget
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

## `git lb` Git alias for recent branches

1. Paste the following in `~/.gitconfig`

```toml
[alias]
    lb = !git reflog show --pretty=format:'%gs ~ %gd' --date=relative | grep 'checkout:' | grep -oE '[^ ]+ ~ .*' | awk -F~ '!seen[$1]++' | head -n 10 | awk -F' ~ HEAD@{' '{printf(\"  \\033[33m%s: \\033[37m %s\\033[0m\\n\", substr($2, 1, length($2)-1), $1)}'
```

## `git-clean`

1. Paste the following in `~/.zshrc`

```sh
# Git Remove tracking branches no longer on remote
# https://stackoverflow.com/a/33548037/4842303

git-clean(){
  git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}
```

## Global `.gitignore`

There are a few files that we don't want Git to track. We can specifically ignore them by adding the files to a global `.gitignore` file.

#### .DS_Store files

`.DS_Store` files are used by Mac OS X to store folder specific metadata information. They are different for every mac, it means that they often cause conflicts in version controlled folders.

Since we never want to track .DS_Store files, we can make a global `.gitignore` file, and tell git to use it for all repositories:

```sh
echo .DS_Store >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

#### public/uploads/, node_modules & bower_components

In the same way, we want to never track the contents of our uploads folder in Rails (which usually contain images or media that we have uploaded during testing) or our node_modules or bower_components.

```sh
echo "/public/uploads/\nnode_modules/\nbower_components/" >> ~/.gitignore_global
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

## Configure GPG keys on Github

1. Install **OpenPGP** (_gpg_)

   ```sh
   brew install gpg
   ```

2. Generate a GPG key

   ```sh
   gpg --full-generate-key
   ```

3. Check the GPG key pair

   ```sh
   gpg --list-secret-keys --keyid-format LONG
   ```

4. Copy the GPG key ID you'd like to use, e.g.

   ```sh
   $ gpg --list-secret-keys --keyid-format LONG
   /Users/hubot/.gnupg/secring.gpg
   ------------------------------------
   sec   4096R/<key number to copy> 2016-03-10 [expires: 2017-03-10]
   uid                          Hubot
   ssb   4096R/42B317FD4BA89E7A 2016-03-10
   ```

5. Copy the GPG key

   ```sh
   gpg --armor --export <key number> | pbcopy
   ```

6. Add your SSH key to GitHub by logging into Github, visiting **account settings** and clicking **GPG keys**. Click **Add GPG key**

## Speed up your cursor

During the course, we will be doing a lot of navigating using our keyboards. By default, the speed of the curson on a Mac is a little too slow. Let's increase the speed of the cursor by going to:

```
System Preferences > Keyboard
```

Move both up to maximum.
