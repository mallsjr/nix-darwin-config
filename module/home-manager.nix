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
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    ls = "eza";
    lg = "lazygit";
    cd = "z";
  };
  programs.zsh.enable = true;
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
  '';
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.eza.enable = true;
  programs.bat.enable = true;
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

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
             }
