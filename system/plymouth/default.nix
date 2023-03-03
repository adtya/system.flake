{ pkgs, ... }: {

  boot.consoleLogLevel = 3;
  boot.kernelParams = [ "quiet" ];
  boot.plymouth = {
    enable = true;
    theme = "darth_vader";
    themePackages = [ pkgs.adi1090x-plymouth ];
  };
}
