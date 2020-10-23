{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    slack
    teams
    zoom-us
    tdesktop
  ];
}
