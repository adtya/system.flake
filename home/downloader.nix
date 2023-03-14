{ ... }: {
  programs = {
    aria2 = {
      enable = true;
      settings = {
        continue = true;
        file-allocation = "falloc";
        max-connection-per-server = 8;
        split = 8;
        min-split-size = "1M";
      };
    };
    yt-dlp = {
      enable = true;
      settings = {
        downloader = "aria2c";
      };
    };
  };
}
