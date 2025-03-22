
alias g=git
alias st='git status'
alias ci='git commit -m'
alias add='git add -p'
alias co='git checkout'

# Increase history size (default is 500)
HISTSIZE=10000
HISTFILESIZE=20000

# Don't put duplicate lines in the history
HISTCONTROL=ignoredups:erasedups

# Append to history, don't overwrite it
shopt -s histappend

# Save and reload the history after each command
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Format to include timestamps
HISTTIMEFORMAT="%F %T "

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
