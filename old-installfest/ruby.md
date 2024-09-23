# Ruby

## Ruby Environment (Rbenv)

A Ruby version manager, is a programme designed to manage multiple installations of Ruby on the same device.

### Rbenv vs Rvm

There are two main Ruby version managers, Rbenv and rvm. Both have advantages and disadvantages. On this course we are going to be using rvm.

**Note**: If a student does have rvm installed:

```sh
rvm implode
gem uninstall rvm
```

### Install Rbenv

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

### Install a version of Ruby with ruby-build

Ruby-build is an rbenv plugin that provides an rbenv install command to compile and install different versions of Ruby on UNIX-like systems.

1. OS X 10.9 comes with Ruby baked in, but it's version is not the latest one. We could upgrade that version of Ruby to a newer one, but what if we needed to run one version of Ruby for one app, and a different version for another?
2. Install Ruby 2.2.3. This is the latest stable version of Ruby:
   `rbenv install 2.2.3`
3. This is required every time we install a new Ruby or install a gem with a binary:
   `rbenv rehash`
4. Set the global Ruby to the one we've just installed, which is a sensible default:
   `rbenv global 2.2.3`
5. Test you have the right version with `ruby -v`

### Skip gem rdoc generation

Whenever we install a gem, it also installs a bunch of documentation we probably don't want - the following command allows us to avoid this:

```sh
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc
```

### Bundler

Bundler manages Ruby gems per-project/application, and makes it trivial to install all the dependencies for an application:

```sh
gem install bundler
rbenv rehash
```

If you install a gem that includes 'binaries' (or any generally available command line scripts), you need to run `rbenv rehash` so that rbenv can create the necessary shim files, (a shim file ensures there's no threat of incompatibilities between libraries or systems like Bundler and rbenv.)
