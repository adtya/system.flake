{ pkgs, ... }:

{
  programs.mako.enable = true;
  programs.mako.extraConfig = ''
    font=FiraCode Nerd Font 11
    margin=20
    border-size=3
    icons=1
    icon-path=/home/adtya/.icons/Dracula
    markup=1
    default-timeout=3000

    background-color=#282a36
    text-color=#f8f8f2
    border-color=#8be9fd

    [urgency=low]
    background-color=#282a36
    text-color=#f8f8f2
    border-color=#6272a4

    [urgency=high]
    background-color=#282a36
    text-color=#ff5555
    border-color=#ff5555
  '';
}
