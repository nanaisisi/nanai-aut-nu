if (which winget | is-empty) {
    print "winget is not installed"
} else {
    print "winget listup"
    winget upgrade
}
if (which scoop | is-empty) {
    print "scoop is not installed"
} else {
    print "scoop update"
    scoop update -a
}
if (which clink | is-empty) {
    print "clink is not installed"
} else {
    print "clink update"
    clink update
}
if (which wsl | is-empty) {
    print "wsl is not installed"
} else {
    print "wsl update"
    wsl --update --pre-release
}
source not_termux.nu
if (which uv | is-empty) {
    print "uv is not installed"
} else {
    print "uv update"
    uv self update
}

    print "git update"
    git update-git-for-windows