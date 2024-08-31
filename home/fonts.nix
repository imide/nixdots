{pkgs, ...}: {
  home.packages = let
    nerdFonts = pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ];
    };
  in [
    nerdFonts
  ];
}
