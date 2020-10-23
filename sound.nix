{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pavucontrol
    #pulseeffects
    #gst-plugins-bad
    #gst-plugins-good
    #lsp-plugins
    #calf
    #zam-plugins
    #mda_lv2
    #libsamplerate
    #libsndfile
    #zita-convolver
    #libebur128
  ];
}
