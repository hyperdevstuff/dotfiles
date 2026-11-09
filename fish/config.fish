# === ENVIRONMENT ===
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx SUDO_EDITOR nvim
set -gx BAT_THEME gruvbox-dark
set -gx MANPAGER "nvim +Man!"

# zoxide
set -gx _ZO_ECHO 1
set -gx _ZO_FZF_OPTS "--height 40% --layout=reverse --info=inline --border --preview 'eza --tree --level=2 --icons --color=always {2}' | head -200"

# go
set -gx GOPATH $HOME/.go
fish_add_path $GOPATH/bin /usr/local/go/bin

# bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

# deno
fish_add_path $HOME/.deno/bin

# cargo
fish_add_path $HOME/.cargo/bin

# local bin
fish_add_path $HOME/.local/bin

# zvm (zig version manager)
set -gx ZVM_INSTALL $HOME/.zvm/self
fish_add_path $HOME/.zvm/bin $ZVM_INSTALL

# pnpm
set -gx PNPM_HOME $HOME/.local/share/pnpm
fish_add_path $PNPM_HOME

# android
set -gx ANDROID_HOME /opt/android-sdk
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/tools/bin

# atuin
fish_add_path $HOME/.atuin/bin

# fish conf
set fzf_preview_dir_cmd eza --all --color=always
set fzf_fd_opts --hidden --max-depth 8

if status is-interactive

    # No greeting
    set fish_greeting

    # fzf bindings
    fzf_configure_bindings --variables=\e\cv --directory=\cd

    # starship prompt
    starship init fish | source

    # zoxide — replaces cd with smart matching
    zoxide init --cmd cd fish | source
    # atuin — shell history
    atuin init fish --disable-up-arrow | source

    # fnm (node version manager)
    if test -d $HOME/.local/share/fnm/fnm
        fnm env --use-on-cd | source
    end

    # quickshell sequences
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # === KEYBINDINGS ===
    fish_vi_key_bindings

    bind \e 'commandline ""'

    # visual mode
    bind -m visual V beginning-of-line begin-selection end-of-line force-repaint
    bind -M visual -m default u end-selection force-repaint
    bind -M visual \x24 end-of-line
    bind -M visual \x5e beginning-of-line
    bind -M visual 0 beginning-of-line
    bind -M visual gg beginning-of-buffer
    bind -M visual G end-of-buffer

    bind d0 backward-kill-line

    # yazi integration — cd into visited directories
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    bind -M insert \ce open_yazi
    function open_yazi
        y
        commandline -f repaint
    end

    # autosuggestion accept
    bind -m insert \cy accept-autosuggestion

    # history search
    bind -m insert \cp up-or-search
    bind -m insert \cn down-or-search

    # source aliases
    if test -f ~/.config/fish/aliases.fish
        source ~/.config/fish/aliases.fish
    end
end
