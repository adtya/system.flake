{ pkgs, ... }:

{
  services.swayidle.enable = true;
  services.swayidle.events = [
    { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f -i /tmp/lockpaper.jpg"; }
  ];
  services.swayidle.timeouts = [
    { timeout = 600; command = "${pkgs.swaylock}/bin/swaylock -f -i /tmp/lockpaper.jpg"; }
  ];
}
