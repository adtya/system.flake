{ pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;
        settings = {
          "browser.selfsupport.url" = "";
          "browser.aboutHomeSnippets.updateUrl" = "";
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.startup.homepage_override.buildID" = "";
          "dom.event.contextmenu.enabled" = false;
          "dom.event.clipboardevents.enabled" = false;
          "extensions.pocket.enabled" = false;
          "extensions.pocket.showHome" = false;
          "network.IDN_show_punycode" = true;
          "privacy.firstparty.isolate" = true;
          "privacy.trackingprotection.enabled" = true;
          "services.sync.prefs.sync.browser.startup.homepage" = false;
          "startup.homepage_welcome_url" = "";
          "startup.homepage_welcome_url.additional" = "";
          "startup.homepage_override_url" = "";
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          dracula-dark-colorscheme
          onepassword-password-manager
        ];
      };
    };
    librewolf.enable = true;
  };
}
