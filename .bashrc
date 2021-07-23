## .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# From: https://docs.aws.amazon.com/dlami/latest/devguide/setup-jupyter-start-server.html
alias start-jupyter="jupyter notebook --certfile=~/ssl/mycert.pem --keyfile ~/ssl/mykey.key"

# From: https://docs.aws.amazon.com/dlami/latest/devguide/setup-jupyter-config.html
function setup-jupyter () {
    jupyter lab password
    mkdir -p ~/ssl
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout ~/ssl/mykey.key -out ~/ssl/mycert.pem
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ec2-user/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ec2-user/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ec2-user/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ec2-user/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
