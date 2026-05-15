if ((which winget) | is-empty) {
    print "winget is not installed"
} else {
    print "winget list"
    print "Use you yourself UniGetUI"
    winget upgrade
}
if ((which scoop) | is-empty) {
    print "scoop is not installed"
} else {
    print "scoop update"
    scoop update -a
}
if ((which clink) | is-empty) {
    print "clink is not installed"
} else {
    print "clink update"
    clink update
}
if ((which wsl) | is-empty) {
    print "wsl is not installed"
} else {
    print "wsl update"
    wsl --update --pre-release
}

if ((which uv) | is-empty) {
    print "uv is not installed"
} else {
    print "uv update"
    uv self update
}

# Gitはあるだろう
print "git update"
git update-git-for-windows

if ((which winapp) | is-empty) {
    print "winapp is not installed"
} else {
    print "winapp update"
    winapp update
}

if ((which copilot) | is-empty) {
    print "copilot is not installed"
} else {
    print "copilot update"
    copilot update
}

if not ((which rustup) | is-empty) {
    rustup self update
    rustup update
} else {
    print "rustup is not installed"
}

if not ((which deno) | is-empty) {
    deno upgrade
} else {
    print "deno is not installed"
}

if not ((which uv) | is-empty) {
    uv self update
    uv tool upgrade --all
} else {
    print "uv is not installed"
}

if not ((which pip) | is-empty) {
    uv pip install --upgrade pip
    uv pip install --upgrade pip-review
    pip-review --auto
} else {
    print "pip is not installed"
}

source cargo_win_upg.nu
