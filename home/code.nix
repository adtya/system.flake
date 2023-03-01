{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      ms-azuretools.vscode-docker
      jnoortheen.nix-ide
    ];
    userSettings = {
      "workbench.startupEditor" = "none";
      "files.autoSave" = "onFocusChange";
      "editor.fontFamily" = "'FiraCode Nerd Font'";
      "editor.fontSize" = 16;
      "editor.cursorStyle" = "line";
      "editor.cursorBlinking" = "phase";
      "editor.fontLigatures" = true;
      "window.titleBarStyle" = "native";
      "breadcrumbs.enabled" = true;
      "window.menuBarVisibility" = "toggle";
      "update.mode" = "none";
      "extensions.ignoreRecommendations" = true;
      "telemetry.telemetryLevel" = "off";
      "zenMode.fullScreen" = false;
      "zenMode.hideLineNumbers" = false;
      "zenMode.hideStatusBar" = false;
      "zenMode.centerLayout" = false;
      "explorer.autoReveal" = true;
      "explorer.openEditors.visible" = 0;
      "editor.minimap.enabled" = true;
      "editor.minimap.renderCharacters" = false;
      "editor.minimap.showSlider" = "always";
      "editor.minimap.maxColumn" = 200;
      "editor.renderWhitespace" = "all";
      "editor.smoothScrolling" = true;
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.lineNumbers" = "relative";
      "editor.rulers" = [
        80
      ];
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;
      "workbench.settings.enableNaturalLanguageSearch" = false;
      "editor.detectIndentation" = true;
      "window.title" = ''''${dirty} ''${activeEditorMedium}''${separator}''${rootName}'';
      "workbench.editor.enablePreviewFromQuickOpen" = false;
      "terminal.integrated.cursorStyle" = "underline";
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.fontFamily" = "FiraCode Nerd Font Mono";
      "workbench.colorTheme" = "Dracula";
      "workbench.iconTheme" = "vs-seti";
      "files.exclude" = {
        "**/node_modules" = true;
        "**/.git" = true;
        "**/.svn" = true;
        "**/.hg" = true;
        "**/CVS" = true;
        "**/.DS_Store" = true;
      };
      "files.watcherExclude" = {
        "**/.git/objects/**" = true;
        "**/.git/subtree-cache/**" = true;
        "**/node_modules/**" = true;
      };
      "terminal.integrated.detectLocale" = "off";
      "git.enableSmartCommit" = true;
      "git.autofetch" = true;
      "window.zoomLevel" = 1;
    };
  };
}
