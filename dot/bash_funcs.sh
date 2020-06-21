#
# Bash functions.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

mkgit() {
    mkdir -p "$1" && cd "$1" && git i && cd ..
}
