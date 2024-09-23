# Zsh

## What is a shell?

We will go into a bit more detail about the shell later on in the course but a shell is a very basic user interface for accessing an operating system's services.

## bash vs zsh

Macs before OSX Catalina came shipped with a shell called 'bash' by default. Bash stands for **'Bourne-again shell'**, referring to its objective as a free replacement for the Bourne shell which was developed by [Steven Bourne](https://en.wikipedia.org/wiki/Stephen_R._Bourne).

<details>
  <summary>
    ⚠️ If you are using Catalina or a greater version skip these inside steps ⚠️
  </summary>

We are going to use another shell called zsh because it has some extra features to make our web-development easier.

The American English pronunciation of Z is "zee", so Z shell rhymes with C shell, which sounds like seashell. zsh was also the login of the original developer Paul Falstad's Yale professor Zhong Shao.

### Install

1.  Type `brew install zsh` Type `0` if the prompt ask you about .zshrc
2.  Type `zsh` . You should have a different prompt
3.  Type `exit` to return to bash
4.  Type `which zsh` to determine where your new shell has installed
5.  Type `code /etc/shells` and add `/YOUR/PATH/TO/zsh`. (Lists trusted shells. The chsh command allows users to change their login shell only to shells listed in this file)
6.  In a new tab, type `chsh -s /YOUR/PATH/TO/zsh`, then close and reopen your terminal application to This will enable zsh by default.
7.  Type `echo $SHELL`. this should return `/YOUR/PATH/TO/zsh`
</details>

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

## Increase ZSH history

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

## Install personal ZSH scripts

- Follow this instructions https://github.com/pataruco/sh-scripts
