{ config, lib, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    config = {
      bash_path = "${pkgs.bash}/bin/bash";
      strict_env = true;
    };
  };

#  programs.git = {
#    enable = true;
#    package = pkgs.gitAndTools.gitFull;
#    userName = "y0an";
#    userEmail = "yoan.rousseau+github@gmail.com";
#    aliases = {
#      co = "checkout";
#      ci = "commit";
#      mj = "!gitmoji -c";
#      st = "status";
#      glog = "log --graph --oneline --decorate --all";
#    };
#    extraConfig = {
#      gui = {
#        fontui = ''
#          -family \"Noto Sans\" -size 12 -weight normal -slant roman -underline 0 -overstrike 0'';
#        fontdiff = ''
#          -family \"Fira Code Retina\" -size 10 -weight normal -slant roman -underline 0 -overstrike 0'';
#      };
#    };
#  };

  programs.htop = {
    enable = true;
    detailedCpuTime = true;
    showProgramPath = false;
    meters.left = [ "LeftCPUs2" "Memory" "Swap" ];
    meters.right = [
      "RightCPUs2"
      {
        kind = "Tasks";
        mode = 2;
      }
      {
        kind = "LoadAverage";
        mode = 2;
      }
      {
        kind = "Uptime";
        mode = 2;
      }
    ];
  };

  programs.vim = {
    enable = true;
    plugins =
      [ pkgs.vimPlugins.vim-colors-solarized pkgs.vimPlugins.vim-nix ];
  };

  home.file.".zshrc".text = ''
  # a fix for https://github.com/NixOS/nixpkgs/issues/27587
  autoload -U compinit && compinit
  [ -f ~/.config/.misc_aliases ] && source ~/.config/.misc_aliases
  [ -f ~/.config/kubectl/.kubectl_aliases ] && source ~/.config/kubectl/.kubectl_aliases
  [ -f ~/.config/kubectl/.kubectl_aliases ] && source <(cat ~/.config/kubectl/.kubectl_aliases | sed -r 's/( kubectl.*) --watch/watch\1/g')
  function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }
  eval $(thefuck --alias)
  '';

  
  

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = false;
      share = false;
    };
    localVariables = { DEFAULT_USER = "y0an"; };
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "agnoster";
    oh-my-zsh.plugins = [
      "ansible"
      "colored-man-pages"
      "git"
      "git-extras"
      "gradle"
      "httpie"
      "mvn"
      "npm"
      "nvm"
      "pip"
      "rvm"
      "systemd"
      "vagrant"
    ];
    plugins = [{
      name = "zsh-syntax-highlighting";
      file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      src = pkgs.zsh-syntax-highlighting;
    }];
  };

}
