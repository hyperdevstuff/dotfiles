# Core aliases
alias n nvim
alias c clear
alias q 'qs -c ii'
alias lg lazygit
alias lD lazydocker
alias ta 'tmux attach'
alias md mkdir
alias rm 'rm -Ii'
alias evil hx
alias wman wikiman
alias steal 'git clone'
alias size 'du -sh --block-size=MB'
alias rel 'source ~/.config/fish/config.fish'

# Pacman/Yay aliases (arch style)
alias pacin 'sudo pacman -S'
alias pacup 'sudo pacman -Syu'
alias pacrem 'sudo pacman -Rns'
alias pacsr 'pacman -Ss'
alias paclst 'pacman -Qe'
alias pacclean 'sudo pacman -Sc'
alias pacorph 'sudo pacman -Rns (pacman -Qtdq)'

# Yay aliases
alias yain 'yay -S'
alias yaup 'yay -Syu'
alias yaupg 'yay -Syu'
alias yarem 'yay -Rns'
alias yasr 'yay -Ss'
alias yaclean 'yay -Sc'
alias yaorph 'yay -Rns (yay -Qtdq)'

# Node/npm aliases
alias ni 'npm install'
alias nid 'npm install --save-dev'
alias nr 'npm run'
alias ns 'npm start'
alias nt 'npm test'
alias nb 'npm run build'
alias nw 'npm run watch'

# bun shortcuts
alias b bun
alias bi 'bun install'
alias bid 'bun install --dev'
alias ba 'bun add'
alias bad 'bun add --dev'
alias br 'bun run'
alias bs 'bun start'
alias bt 'bun test'
alias bx bunx
alias bu 'bun update'
alias bd 'bun dev'

# pnpm shortcuts
alias ppm pnpm
alias ppi 'pnpm install'
alias ppid 'pnpm install --save-dev'
alias ppr 'pnpm run'
alias pps 'pnpm start'
alias ppt 'pnpm test'
alias ppb 'pnpm build'
alias ppw 'pnpm watch'

# Docker shortcuts
alias d docker
alias dc 'docker compose'
alias dcu 'docker compose up'
alias dcd 'docker compose down'
alias dcl 'docker compose logs'
alias dps 'docker ps'
alias dpsa 'docker ps -a'
alias dim 'docker images'
alias drm 'docker rm'
alias drmi 'docker rmi'
alias dex 'docker exec -it'
alias dprune 'docker system prune -af'

# Git shortcuts
alias g git
alias gs 'git status'
alias ga 'git add'
alias gaa 'git add --all'
alias gc 'git commit'
alias gcm 'git commit -m'
alias gp 'git push'
alias gpl 'git pull'
alias gd 'git diff'
alias gco 'git checkout'
alias gb 'git branch'
alias glog 'git log --oneline --graph --all'

# Misc shortcuts
alias pamcan pacman
alias wtf3000 'fuser -v 3000/tcp'
alias ports 'netstat -tulanp'

# fzf helpers
alias ff 'fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias nf 'fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'
alias nd 'nvim -c Oil'

# Eza listing
alias ls 'eza --icons --color=auto --group-directories-first'
alias ll 'eza --long --icons --color=auto --group-directories-first'
alias la 'eza --long --all --icons --color=auto --group-directories-first'
alias lt 'eza --tree --level=2 --icons --color=auto'
alias tree 'eza --tree --level=4 --icons --color=auto --group-directories-first'
alias lS 'eza --long --icons --sort=size --reverse'
alias lm 'eza --long --icons --sort=modified --reverse --time-style=long-iso'
alias lc 'eza --long --icons --sort=changed --reverse --time-style=long-iso'
alias lT 'eza --long --icons --time=created --sort=created --reverse --time-style=long-iso'
alias ld 'eza --long --only-dirs --icons --color=auto'
alias l. 'eza --long --all --icons --color=auto --ignore-glob=".*" | grep "^\."'
alias lE 'eza --long --icons --sort=extension'
alias lG 'eza --long --icons --git'
alias lx 'eza --long --icons --extended'
alias li 'eza --long --icons --inode'
alias lo 'eza --long --icons --octal-permissions'
alias lp 'eza --long --icons --no-filesize --no-time --no-user'
alias lh 'eza --long --header --icons --across --group-directories-first'
alias lgg 'eza --grid --icons --color=auto --group-directories-first'

# Systemd shortcuts
alias sctl systemctl
alias sctle 'systemctl enable'
alias sctld 'systemctl disable'
alias sctls 'systemctl start'
alias sctlr 'systemctl restart'
alias sctlt 'systemctl stop'
alias sctlst 'systemctl status'
alias usctl 'systemctl --user'
alias jctl journalctl
alias jctlf 'journalctl -f'
alias jctlu 'journalctl -u'
