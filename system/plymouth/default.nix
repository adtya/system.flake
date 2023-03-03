{ pkgs, ... }: {

  boot.consoleLogLevel = 3;
  boot.kernelParams = [ "quiet" ];
  boot.plymouth = {
    enable = true;
    theme = "rog_2";
    themePackages = [ pkgs.adi1090x-plymouth ];
  };
}
