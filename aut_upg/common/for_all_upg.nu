if ((which uv) | is-empty) {
    print "uv update"
    uv self update
    uv tool upgrade --all
    uv pip install --system --upgrade pip
    uv pip install --system --upgrade pip-review
    pip-review --auto
} else {
    print "uv is not installed"
}

if not ((which deno) | is-empty) {
    print "deno update"
    deno upgrade
} else {
    print "deno is not installed"
}
