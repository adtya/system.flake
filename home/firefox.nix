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
          "browser.aboutConfig.showWarning" = false;
          "browser.aboutHomeSnippets.updateUrl" = "";
          "browser.newtabpage.activity-stream.asrouter.providers.snippets" = "";
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.discoverystream.config" = "";
          "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
          "browser.newtabpage.activity-stream.discoverystream.endpoints" = "";
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.startup.homepage_override.buildID" = "";
          "browser.tabs.firefox-view" = false;
          "browser.toolbars.bookmarks.visibility" = "always";
          "browser.urlbar.suggest.topsites" = false;
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
