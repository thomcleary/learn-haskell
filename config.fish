# batcat
alias bat=batcat
set -x MANPAGER \"sh -c 'col -bx | batcat -l man -p'\"
set -x MANROFFOPT "-c"

# Haskell tools
set -gx PATH /root/.ghcup/bin $PATH

# starship
starship init fish | source
