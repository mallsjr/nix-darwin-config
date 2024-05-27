{pkgs, ...}: {
# add home-manager user settings here
# this just pust the packages in the shell it does not allow to configure.
  home.packages = with pkgs; [
    git 
    neovim 
    neofetch 
    just 
    erdtree
    lazygit
    tlrc
    fd
    ripgrep
    pure-prompt
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    ls = "eza";
    lg = "lazygit";
    cd = "z";
    l = "ls -l";
  };
  programs.zsh.enable = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.initExtra = ''
    function yy() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
            fi
            rm -f -- "$tmp"
    }

    # History
    HISTSIZE=5000
    HISTFILE=~/.zsh_history
    SAVEHIST=$HISTSIZE
    HISTDUP=erase
    setopt appendhistory
    setopt sharehistory
    setopt hist_ignore_space
    setopt hist_ignore_all_dups
    setopt hist_save_no_dups
    setopt hist_ignore_dups
    setopt hist_find_no_dups

    source "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix/nix-zsh-completions.plugin.zsh"
    source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.zsh"

    # Completion styling
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
    zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    zstyle ':completion:*' menu no

    #Pure prompt
    autoload -U promptinit; promptinit
    prompt pure
  '';
  programs.zsh.plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.zsh-autosuggestions;
      # more than likely the file attribute is needed here for the above source calls to not be
    }
    {
      name = "zsh-completions";
      src = pkgs.zsh-completions;
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.zsh-syntax-highlighting;
    }
    {
      name = "zsh-fzf-tab";
      src = pkgs.zsh-fzf-tab;
    }
  ];
  #programs.starship = {
  #  enable = true;
  #  enableZshIntegration = true;
  #};
  programs.eza.enable = true;
  programs.bat.enable = true;
  programs.bat.config = { theme = "gruvbox-dark"; };
  programs.tmux.enable = true;
  programs.tmux.keyMode = "vi";
  programs.tmux.mouse = true;
	programs.tmux.extraConfig = ''
    set -g default-terminal "screen-256color"
  '';
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nnn.enable = true;
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
             }
