{ pkgs, ... }:
{
  programs = {
    librewolf.enable = true;
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
          "gfx.webrender.all" = true;
          "identity.fxaccounts.account.device.name" = "Skipper";
          "layers.acceleration.force-enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.firstparty.isolate" = true;
          "startup.homepage_welcome_url" = "";
          "startup.homepage_welcome_url.additional" = "";
          "startup.homepage_override_url" = "";
          "svg.context-properties.content.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          onepassword-password-manager
          dracula-dark-colorscheme
        ];
        userChrome = ''
          /*
          ┌─┐┬┌┬┐┌─┐┬  ┌─┐
          └─┐││││├─┘│  ├┤
          └─┘┴┴ ┴┴  ┴─┘└─┘
          ┌─┐┌─┐─┐ ┬
          ├┤ │ │┌┴┬┘
          └  └─┘┴ └─

          by Miguel Avila

          */

          /*

          ┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
          │  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
          └─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘

          */

          :root {
            --sfwindow: #19171a;
            --sfsecondary: #201e21;
          }

          /* Urlbar View */

          /*─────────────────────────────*/
          /* Comment this section if you */
          /* want to show the URL Bar    */
          /*─────────────────────────────*/

          .urlbarView {
            display: none !important;
          }

          /*─────────────────────────────*/

          /*
          ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
          │  │ ││  │ │├┬┘└─┐
          └─┘└─┘┴─┘└─┘┴└─└─┘
          */

          /* Tabs colors  */
          #tabbrowser-tabs:not([movingtab])
            > #tabbrowser-arrowscrollbox
            > .tabbrowser-tab
            > .tab-stack
            > .tab-background[multiselected='true'],
          #tabbrowser-tabs:not([movingtab])
            > #tabbrowser-arrowscrollbox
            > .tabbrowser-tab
            > .tab-stack
            > .tab-background[selected='true'] {
            background-image: none !important;
            background-color: var(--toolbar-bgcolor) !important;
          }

          /* Inactive tabs color */
          #navigator-toolbox {
            background-color: var(--sfwindow) !important;
          }

          /* Window colors  */
          :root {
            --toolbar-bgcolor: var(--sfsecondary) !important;
            --tabs-border-color: var(--sfsecondary) !important;
            --lwt-sidebar-background-color: var(--sfwindow) !important;
            --lwt-toolbar-field-focus: var(--sfsecondary) !important;
          }

          /* Sidebar color  */
          #sidebar-box,
          .sidebar-placesTree {
            background-color: var(--sfwindow) !important;
          }

          /*

          ┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐
           ││├┤ │  ├┤  │ ├┤
          ─┴┘└─┘┴─┘└─┘ ┴ └─┘
          ┌─┐┌─┐┌┬┐┌─┐┌─┐┌┐┌┌─┐┌┐┌┌┬┐┌─┐
          │  │ ││││├─┘│ ││││├┤ │││ │ └─┐
          └─┘└─┘┴ ┴┴  └─┘┘└┘└─┘┘└┘ ┴ └─┘

          */

          /* Tabs elements  */
          .tab-close-button {
            display: none;
          }

          .tabbrowser-tab:not([pinned]) .tab-icon-image {
            display: none !important;
          }

          #nav-bar:not([tabs-hidden='true']) {
            box-shadow: none;
          }

          #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
            > #tabbrowser-arrowscrollbox
            > .tabbrowser-tab[first-visible-unpinned-tab] {
            margin-inline-start: 0 !important;
          }

          :root {
            --toolbarbutton-border-radius: 0 !important;
            --tab-border-radius: 0 !important;
            --tab-block-margin: 0 !important;
          }

          .tab-background {
            border-right: 0px solid rgba(0, 0, 0, 0) !important;
            margin-left: -4px !important;
          }

          .tabbrowser-tab:is([visuallyselected='true'], [multiselected])
            > .tab-stack
            > .tab-background {
            box-shadow: none !important;
          }

          .tabbrowser-tab[last-visible-tab='true'] {
            padding-inline-end: 0 !important;
          }

          #tabs-newtab-button {
            padding-left: 0 !important;
          }

          /* Url Bar  */
          #urlbar-input-container {
            background-color: var(--sfsecondary) !important;
            border: 1px solid rgba(0, 0, 0, 0) !important;
          }

          #urlbar-container {
            margin-left: 0 !important;
          }

          #urlbar[focused='true'] > #urlbar-background {
            box-shadow: none !important;
          }

          #navigator-toolbox {
            border: none !important;
          }

          /* Bookmarks bar  */
          .bookmark-item .toolbarbutton-icon {
            display: none;
          }
          toolbarbutton.bookmark-item:not(.subviewbutton) {
            min-width: 1.6em;
          }

          /* Toolbar  */
          #tracking-protection-icon-container,
          #urlbar-zoom-button,
          #star-button-box,
          #pageActionButton,
          #pageActionSeparator,
          #tabs-newtab-button,
          #back-button,
          #PanelUI-button,
          #forward-button,
          .tab-secondary-label {
            display: none !important;
          }

          .urlbarView-url {
            color: #dedede !important;
          }

          /* Disable elements  */
          #context-navigation,
          #context-savepage,
          #context-pocket,
          #context-sendpagetodevice,
          #context-selectall,
          #context-viewsource,
          #context-inspect-a11y,
          #context-sendlinktodevice,
          #context-openlinkinusercontext-menu,
          #context-bookmarklink,
          #context-savelink,
          #context-savelinktopocket,
          #context-sendlinktodevice,
          #context-searchselect,
          #context-sendimage,
          #context-print-selection {
            display: none !important;
          }

          #context_bookmarkTab,
          #context_moveTabOptions,
          #context_sendTabToDevice,
          #context_reopenInContainer,
          #context_selectAllTabs,
          #context_closeTabOptions {
            display: none !important;
          }
        '';
        userContent = ''
          /*
          ┌─┐┬┌┬┐┌─┐┬  ┌─┐
          └─┐││││├─┘│  ├┤
          └─┘┴┴ ┴┴  ┴─┘└─┘
          ┌─┐┌─┐─┐ ┬
          ├┤ │ │┌┴┬┘
          └  └─┘┴ └─

          by Miguel Avila

          */

          :root {
            scrollbar-width: none !important;
          }

          @-moz-document url(about:privatebrowsing) {
            :root {
              scrollbar-width: none !important;
            }
          }
        '';
      };
    };
  };
}
