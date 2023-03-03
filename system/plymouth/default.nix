{ pkgs, ... }: {

  boot.plymouth = {
    enable = true;
    theme = "black_hud";
    themePackages = [ pkgs.adi1090x-plymouth ];
  };
}
