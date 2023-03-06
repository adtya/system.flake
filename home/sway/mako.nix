{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    font = "FiraCode Nerd Font 11";
    backgroundColor = "#1E1E2E";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
    extraConfig = ''
      [urgency=high]
      border-color=#fab387
    '';
  };
}
