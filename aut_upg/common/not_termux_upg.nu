#not termux

if not ((which rustup) | is-empty) {
    print "rustup update"
    rustup self update
    rustup update
} else {
    print "rustup is not installed"
}
