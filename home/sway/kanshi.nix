{ ... }:

{
  services.kanshi.enable = true;
  services.kanshi.profiles = {
    undocked = {
      outputs = [
        {
          criteria = "eDP-1";
          mode = "1920x1080";
          position = "0,0";
        }
      ];
    };
    docked = {
      outputs = [
        {
          criteria = "eDP-1";
          transform = "normal";
          mode = "1920x1080";
          position = "0,360";
          scale = 1.5;
        }
        {
          criteria = "DP-1";
          transform = "normal";
          mode = "1920x1080";
          position = "1280,0";
        }
      ];
    };
  };
}
