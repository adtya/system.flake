{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    font = "FiraCode Nerd Font 11";
    backgroundColor = "#282A36";
    borderColor = "#282A36";
    progressColor = "over #313244";
    textColor = "#44475A";
    extraConfig = ''
      [urgency=low]
      border-color=#282a36

      [urgency=normal]
      border-color=#f1fa8c

      [urgency=high]
      border-color=#ff5555
    '';
  };
}
