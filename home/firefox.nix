{ pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
      package =
        (pkgs.firefox.override {
          extraPolicies = {
            DontCheckDefaultBrowser = true;
            DisablePocket = true;
            DisableTelemetry = true;
            DisplayBookmarksToolbar = "always";
            EnableTrackingProtection = {
              "Value" = true;
              "Locked" = true;
              "Cryptomining" = true;
              "Fingerprinting" = true;
            };
            FirefoxHome = {
              "Search" = true;
              "TopSites" = false;
              "SponsoredTopSites" = false;
              "Highlights" = false;
              "Pocket" = false;
              "SponsoredPocket" = false;
              "Snippets" = false;
              "Locked" = true;
            };
            NoDefaultBookmarks = true;
            OfferToSaveLogins = false;
            SearchSuggestEnabled = false;
            StartDownloadsInTempDirectory = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            ExtensionSettings = {
              "{b743f56d-1cc1-4048-8ba6-f9c2ab7aa54d}" = {
                "allowed_types" = "theme";
                "installation_mode" = "force_installed";
                "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/dracula-dark-colorscheme/latest.xpi";
              };
              "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
                "allowed_types" = "extension";
                "installation_mode" = "force_installed";
                "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
              };
              "queryamoid@kaply.com" = {
                "allowed_types" = "extension";
                "installation_mode" = "force_installed";
                "install_url" = "https://github.com/mkaply/queryamoid/releases/download/v0.2/query_amo_addon_id-0.2-fx.xpi";
              };
            };
            Preferences = {
              "browser.crashReports.unsubmittedCheck.autoSubmit2" = { Value = false; Status = "locked"; };
              "browser.selfsupport.url" = { Value = ""; Status = "locked"; };
              "browser.aboutConfig.showWarning" = { Value = false; Status = "locked"; };
              "browser.aboutHomeSnippets.updateUrl" = { Value = ""; Status = "locked"; };
              "browser.startup.homepage_override.mstone" = { Value = "ignore"; Status = "locked"; };
              "browser.startup.homepage_override.buildID" = { Value = ""; Status = "locked"; };
              "browser.tabs.firefox-view" = { Value = false; Status = "locked"; };
              "dom.event.contextmenu.enabled" = { Value = false; Status = "locked"; };
              "dom.event.clipboardevents.enabled" = { Value = false; Status = "locked"; };
              "dom.security.https_only_mode" = { Value = true; Status = "locked"; };
              "extensions.htmlaboutaddons.recommendations.enabled" = { Value = false; Status = "locked"; };
              "extensions.recommendations.themeRecommendationUrl" = { Value = ""; Status = "locked"; };
              "network.IDN_show_punycode" = { Value = true; Status = "locked"; };
            };
          };
        });
      profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;
        settings = {
          "app.shield.optoutstudies.enabled" = false;
          "identity.fxaccounts.account.device.name" = "Skipper";
          "privacy.donottrackheader.enabled" = true;
          "privacy.firstparty.isolate" = true;
          "startup.homepage_welcome_url" = "";
          "startup.homepage_welcome_url.additional" = "";
          "startup.homepage_override_url" = "";
        };
      };
    };
  };
}
