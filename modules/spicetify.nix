{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];

    theme = {
      name = "Hazy";
      src = pkgs.fetchFromGitHub {
        owner = "Astromations";
        repo = "Hazy";
        rev = "main"; # troque pelo commit hash depois (veja nota abaixo)
        hash = "sha256-2D8hcPaAqsXv7krzd8n77LqxaQzf2GMCqiDuq1YHLks="; # deixe vazio na primeira build, o Nix te dá o hash correto no erro
      };
      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      overwriteAssets = true;
    };
    # o Hazy não usa colorScheme do jeito que o catppuccin usa (color.ini próprio),
    # então normalmente você remove/comenta essa linha ao trocar de tema:
    # colorScheme = "mocha";
  };
}
