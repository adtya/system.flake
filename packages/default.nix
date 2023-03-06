self: super:
{
  adi1090x-plymouth = super.callPackage ./adi1090x-plymouth { };
  dracula-gtk = super.callPackage ./dracula-gtk { };
  newaita-icons = super.callPackage ./newaita-icons { };
}
