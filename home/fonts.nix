{pkgs, ...}: {
  home.packages = let
    nerdFonts = pkgs.nerdfonts.override {
      fonts = [
        "Terminus"
        "SpaceMono"
        "JetBrainsMono"
        "IosevkaTerm"
        "UbuntuMono"
      ];
    };
  in [
    nerdFonts
  ];
}
