# === BASICS ===
alias n nvim
alias c clear
alias x exit
alias q exit
alias mk mkdir
alias mv 'mv --verbose'
alias :q exit
alias cp 'cp --recursive --verbose --progress'
alias .. 'cd ..'
alias ... 'cd ../..'
alias rel 'source ~/.config/fish/config.fish'

# === TYPO FIXES ===
alias pamcan pacman
alias gti git
alias gut git
alias claer clear

# === SAFE OPS ===
alias rm 'rm -Ii'
alias cp 'cp -i'
alias mv 'mv -i'

# === MODERN CLI ===
alias cat 'bat --style=auto'
alias grep rg
alias find fd
alias tlman tldr
alias diff difftastic
alias top btop

# === EZA LISTINGS ===
alias ls 'eza --icons --color=auto --group-directories-first'
alias ll 'eza --long --icons --color=auto --group-directories-first'
alias la 'eza --long --all --icons --color=auto --group-directories-first'
alias tree 'eza --tree --level=3 --icons --color=auto --group-directories-first'
alias lt 'eza --tree --level=2 --icons'
alias lS 'eza --long --icons --sort=size --reverse'
alias lm 'eza --long --icons --sort=modified --reverse'
alias lG 'eza --long --icons --git'

# === WSL SPECIFIC ===
alias clip 'win32yank.exe -i'
alias paste 'win32yank.exe -o --lf'
alias open wsl-open
alias o wsl-open
alias exp 'explorer.exe .'

# === PACKAGE MANAGEMENT ===
alias yain 'yay -S'
alias yaup 'yay -Syu'
alias yarem 'yay -Rns'
alias yasr 'yay -Ss'
alias yaclean 'yay -Sc && yay -Yc'
alias yaorph 'yay -Rns (yay -Qtdq)'

# === BUN/DEV ===
alias b bun
alias bi 'bun install'
alias ba 'bun add'
alias br 'bun run'
alias bd 'bun dev'
alias bb 'bun build'
alias bt 'bun test'
alias bx bunx

# === GIT ===
alias g git
alias gs 'git status'
alias gst 'git status --short'
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
alias lg lazygit
alias steal 'git clone'

# === FZF MAGIC ===
alias ff 'fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias nf 'fzf -m --preview="bat --color=always {}" --bind "enter:become(nvim {+})"'
alias nd 'nvim -c Oil'
alias fcd 'cd (fd -t d | fzf)'

# === SYSTEM ===
alias ports 'ss -tulpn'
alias wtf3000 'fuser -v 3000/tcp'
alias psg 'ps aux | rg'
alias size 'du -sh --block-size=MB'

# === DOCKER (if u use it) ===
alias d docker
alias dc 'docker compose'
alias dcu 'docker compose up'
alias dcd 'docker compose down'
alias dps 'docker ps'
