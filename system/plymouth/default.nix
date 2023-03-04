{ pkgs, ... }: {

  boot.consoleLogLevel = 3;
  boot.kernelParams = [ "quiet" ];
  boot.plymouth = {
    enable = true;
    themePackages = [ (pkgs.adi1090x-plymouth.override { pack = "pack_3"; theme = "owl"; }) ];
    theme = "adi1090x";
  };
}
