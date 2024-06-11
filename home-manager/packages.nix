{pkgs, ...}: {
    imports = [
        ./modules/packages.nix
        ./scripts/blocks.nix
    ];

    packages = with pkgs; {
        linux = [

        ];
        cli = [
            nh
            ripgrep
            bat
            fish
            
        ]
    }
}