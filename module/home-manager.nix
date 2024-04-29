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

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    ls = "eza";
    lg = "lazygit";
    cd = "z";
  };
  programs.zsh.enable = true;
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
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
             }
