# Fish configuration
# Install to ~/.config/fish/config.fish
#
# Everything referenced here is installed in the "Shell" section of the
# installfest readme: onedark-fish, starship, fzf, fd, bat, zoxide and fnm.

if status is-interactive
    fish_add_path /opt/homebrew/bin
    fish_add_path ~/.local/bin # uv and other per-user installs

    # One Dark palette for the terminal (rkbk60/onedark-fish)
    set_onedark

    # Prompt
    starship init fish | source

    # fzf: Ctrl+R fuzzy history, Ctrl+T fuzzy file picker, Shift+Tab fuzzy completion
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --strip-cwd-prefix --exclude .git'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
    # Option is a normal key on macOS (Option+C types ç), so skip fzf's Alt+C; use `zi` instead
    set -gx FZF_ALT_C_COMMAND ''
    fzf --fish | source

    # zoxide: `z <part of a path>` jumps to the best match, `zi` picks interactively with fzf
    zoxide init fish | source
end

# fnm (Node). Outside the interactive block on purpose: non-interactive shells
# (scripts, editors, pnpm shims) need node on PATH too.
fnm env --use-on-cd --version-file-strategy=recursive | source

# Editor and pager
set -gx EDITOR 'zed -w -n'
set -gx PAGER 'less -f'

# pnpm's installer appends its own PNPM_HOME block below this line.
