{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    docker
    docker-compose
    gitAndTools.hub
    git-up
    graphviz
    ansible
    terraform
    openjdk11
    k9s
    shellcheck
    kubernetes
    minikube
    python3
    kubectx
    kubernetes-helm
    mate.caja-with-extensions
    mate.engrampa
    google-cloud-sdk
    thefuck
    gnumake
    kind
  ];

  programs.vscode = {
    enable = true;
    userSettings = {
      "update.mode" = "none";
      "editor.fontFamily" =
        "'Fira Code Retina', 'Noto Color Emoji', 'Font Awesome 5 Brands', 'Font Awesome 5 Free'";
      # font weight : 300 → light, 400 → regular, 500 → medium, 600 → bold
      "editor.fontWeight" = "400";
      "editor.fontLigatures" = true;
      "files.autoSave" = "onFocusChange";
      "[nix]"."editor.tabSize" = 2;
      "java.home" = "${pkgs.jdk11}";
      "local-history.path" = "~/.config/Code/local-history";
    };
  };
}
