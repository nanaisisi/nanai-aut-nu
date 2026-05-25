#for bash and not termux and not windows because not basic posix

print "updating fzf"
nu -c | cd ~/.fzf; git pull; ./install