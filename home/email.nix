{ config, pkgs, ... }:
let
  user = import ../users/user.nix;
in
{
  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.neomutt = {
    enable = true;
    sidebar.enable = true;
    sort = "reverse-date-received";
    vimKeys = true;
  };
  programs.notmuch = {
    enable = true;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  accounts.email.maildirBasePath = "${config.xdg.dataHome}/emails";
  accounts.email.accounts = {
    "${user.primary.emailAddress}" = {
      primary = true;
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      neomutt.enable = true;
      notmuch.enable = true;
      address = user.primary.emailAddress;
      gpg = {
        key = user.primary.signingKey;
        signByDefault = true;
      };
      realName = user.primary.realName;
      userName = user.primary.emailUserName;
      passwordCommand = ''${pkgs.libsecret}/bin/secret-tool lookup service primary_email'';
      imap = {
        host = "imap.fastmail.com";
        port = 993;
        tls = {
          enable = true;
          useStartTls = false;
        };
      };
      smtp = {
        host = "smtp.fastmail.com";
        port = 465;
        tls = {
          enable = true;
          useStartTls = false;
        };
      };
    };
  };
}
