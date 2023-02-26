{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
  ];
  home.file.".config/wofi/config".text = ''
    show=drun
    allow_images=true
    hide_scroll=true
    prompt=
    lines=10
    show_all=true
    always_parse_args=true
  '';
  home.file.".config/wofi/style.css".text = ''
    * {
      font-family:  FiraCode Nerd Font;
      font-size: 16px;
      font-weight: 400;
    }
      
    #window {
      margin: 0px;
      border: 2px solid;
      border-color: #121212;
      border-radius: 4px;
      background-color: #282a36;
      color: #f8f8f2;
    }

    #input {
      margin: 3px;
      background-color: transparent;
      color: #f8f8f2;
      border-radius: 4px;
    }

    #scroll {
      margin-bottom: 4px;
    }

    #entry {
      margin: 0px 15px;
    }

    #entry:selected {
      background-color: #44475a;
      border-radius: 4px;
      border: none;
      outline: none;
    }

    #entry > box {
      margin-left: 16px;
    }

    #entry image {
      padding-right: 10px;
    }
  '';
}
