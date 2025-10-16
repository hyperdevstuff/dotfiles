function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx SUDO_EDITOR nvim
set -gx BAT_THEME gruvbox-dark
set -gx MANPAGER "nvim +Man!"

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

# zvm (zig version manager?)
set -gx ZVM_INSTALL $HOME/.zvm/self
fish_add_path $HOME/.zvm/bin $ZVM_INSTALL

# pnpm
set -gx PNPM_HOME $HOME/.local/share/pnpm
fish_add_path $PNPM_HOME

# android
set -gx ANDROID_HOME /opt/android-sdk
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/tools/bin

# atuin (add to path first)
fish_add_path $HOME/.atuin/bin

# fish conf
set fzf_preview_dir_cmd eza --all --color=always
set fzf_fd_opts --hidden --max-depth 8

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # fish config
    fzf_configure_bindings --variables=\e\cv --directory=\cd

    # Use starship
    starship init fish | source
    zoxide init --cmd cd fish | source
    atuin init fish --disable-up-arrow | source

    if test -d $HOME/.local/share/fnm/fnm
        fnm env --use-on-cd | source
    end
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    bind \e 'commandline ""'

    bind -m visual V beginning-of-line begin-selection end-of-line force-repaint

    bind d0 backward-kill-line

    bind -M visual -m default u end-selection force-repaint
    bind -M visual \x24 end-of-line
    bind -M visual \x5e beginning-of-line
    bind -M visual 0 beginning-of-line
    bind -M visual gg beginning-of-buffer
    bind -M visual G end-of-buffer

    fish_vi_key_bindings

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # ctrl-e to open yazi
    function open_yazi
        y
        commandline -f repaint
    end

    bind -M insert \ce open_yazi
    # autosuggestion accept
    bind -M insert \cy accept-autosuggestion

    # history search
    bind -M insert \cp up-or-search
    bind -M insert \cn down-or-search
    # recommended, but not default

    if test -f ~/.config/fish/aliases.fish
        source ~/.config/fish/aliases.fish
    end
end
