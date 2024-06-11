let
    name = "imide";
in {
    programs.git = {
        enable = true;
        extraConfig = {
            color.ui = true;
            github.user = name;
            push.autoSetupRemote = true;
        };
        userEmail = "zachary.woren@gmail.com";
        userName = "imide";
    };
}