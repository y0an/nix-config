{ config, lib, pkgs, ... }:

{
  xdg.configFile."i3/config".source = ~/dotfiles/i3.config;
  xdg.configFile."py3status/config".source = ~/dotfiles/py3status.config;
  xdg.configFile."terminator/config".source = ~/dotfiles/terminator.config;
  xdg.configFile."kubectl/.kubectl_aliases".source = ~/dotfiles/kubectl_aliases;
  xdg.configFile.".misc_aliases".source = ~/dotfiles/misc_aliases;
  xdg.configFile."git/config".source = ~/dotfiles/gitconfig;
  xdg.configFile."git/.gitconfig-github".source = ~/dotfiles/gitconfig-github;
  xdg.configFile."git/.gitconfig-solocal".source = ~/dotfiles/gitconfig-solocal;
  xdg.configFile."git/.gitignore_global".source = ~/dotfiles/gitignore_global;
}