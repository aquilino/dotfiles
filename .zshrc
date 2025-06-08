# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

export TERM=xterm

# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat --paging=never'
alias catn='/bin/cat'
# alias custom
alias ..='cd ..'
alias thm='sudo openvpn /home/h1dr0/Escritorio/THM/thm.ovpn &'
alias htb='sudo openvpn /home/h1dr0/Escritorio/HTB/htb_machines.ovpn &'
alias x='chmod +x'
alias s='source'
alias target='cat /home/h1dr0/.config/bin/target'
alias xml2html='xsltproc targeted.xml > index.html'
alias python-ftp='sudo python -m pyftpdlib -p 69 -w -u h1dr0 -P 12345'
#alias responder='python2 /opt/Responder/Responder.py'
alias smbfolder='sudo python3 "$(locate smbserver.py | head -n 1)" smbFolder . -smb2support'

#Plugins
source  /home/h1dr0/.zsh/plugins/zsh-sudo/sudo.plugin.zsh
source  /home/h1dr0/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source  /home/h1dr0/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Functions

function mkt {
	mkdir $1
	cd $1
	mkdir {nmap,content,exploits}
	cd nmap
}

function ipscan {
	arp-scan -l| grep "PCS"|awk '{print $1}'
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}


funtion settarget(){
	if [ $# -eq 1 ]; then
	echo -e '󰓾:'$1 > /home/h1dr0/.config/bin/target
#	gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/simple-message@freddez/schemas set org.gnome.shell.extensions.simple-message message $1
	elif [ $# -gt 2 ]; then
	echo "settarget [IP] [NAME] @ settarget [IP]"
	else
	echo $1 $2 > /home/h1dr0/.config/bin/target
#	gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/simple-message@freddez/schemas set org.gnome.shell.extensions.simple-message message $1 $2
	fi
}

function clstarget(){
	echo " " > /home/h1dr0/.config/bin/target
#	gsettings --schemadir $HOME/.local/share/gnome-shell/extensions/simple-message@freddez/schemas set org.gnome.shell.extensions.simple-message message " "
}

#Prompt
export STARSHIP_CONFIG=/home/h1dr0/.config/starship/starship.toml
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export PATH=$PATH:/home/h1dr0/.local/bin
PATH=~/.console-ninja/.bin:$PATH
