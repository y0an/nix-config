{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    obs-studio
    obs-linuxbrowser
    obs-v4l2sink
    vlc
    kazam
    lightworks
    shotcut
    imagemagick
    #ndi
    #obs-ndi
    #obs-wlrobs
    webcamoid
  ];

  #nixpkgs.config.packageOverrides = pkgs: {
  #  obs-studio = pkgs.ffmpeg-full.override {
  #    nvenc = true;
  #    nonfreeLicensing = true; 
  #    fdkaacExtlib = true; 
  #  };
  #};


}
