{ config, pkgs, ... }:

{
  imports = [
    ./src-config.nix
    ./dev.nix
    ./chat.nix
    ./cli.nix
    ./video.nix
    ./sound.nix
  ];

  nixpkgs.config.allowUnfree = true;

  xsession.profileExtra = ''
    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
  '';
  xsession.pointerCursor = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 32;
  };

  home.packages = with pkgs; [
    arandr
    broot
    direnv
    envsubst
    gimp
    google-chrome
    htop
    iw # for py3status
    inotify-tools
    jq
    keepass
    killall
    neofetch
    nnn
    jmtpfs
    mupdf
    remmina
    rofi
    sxiv
    terminator
    tree
    unzip
    v4l-utils
    whois
    xorg.xbacklight
    xorg.xev
    xorg.xkill
    xdotool # todo https://faq.i3wm.org/question/528/binding-mouse-buttons.1.html
    zathura
    zip
    syncthing
    syncthing-gtk
    libnotify
  ];

  programs.firefox = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };

}