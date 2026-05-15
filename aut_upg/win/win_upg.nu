# Gitはあるだろう
print "git update"
git update-git-for-windows

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

source ../common/not_termux_upg.nu
source cargo_win_upg.nu
