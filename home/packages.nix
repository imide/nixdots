{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix related
    nh
    cachix
    nil
    nix-info
    nixpkgs-fmt
    alejandra
    nix-index

    # dev shit
    devenv

    # misc
    btop
  ];
}
