{pkgs, ...}: {
  home.packages = let
    nerdFonts = pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
        "ubuntu-sans-mono"
      ];
    };
  in [
    nerdFonts
  ];
}
