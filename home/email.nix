{ config, pkgs, ... }:
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
    "adtya.xyz" = {
      primary = true;
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      neomutt.enable = true;
      notmuch.enable = true;
      address = "adtya@adtya.xyz";
      gpg = {
        key = "95ea0e6bf507e8ea346ac8740c7f35f4f821290f";
        signByDefault = true;
      };
      realName = "Adithya Nair";
      userName = "adtya@123mail.org";
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
