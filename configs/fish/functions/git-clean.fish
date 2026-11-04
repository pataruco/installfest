# Delete local branches whose remote branch is gone.
# Install to ~/.config/fish/functions/git-clean.fish
# Based on https://stackoverflow.com/a/33548037/4842303
function git-clean -d "Delete local branches whose remote branch no longer exists"
    git fetch -p
    for branch in (git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
        git branch -D $branch
    end
end
