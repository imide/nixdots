{
    programs.aetherShell = {
        enable = true;

        autostart = [
            "bash -c 'pgrep -x picom || picom -b'"
        ];

        user-likes = {
            wallpaper.rounded_corners.roundness = 0;
            navigator = "thorium-browser";
            terminal = "wezterm";

            theme.colors = {

            }
        };
    };
}