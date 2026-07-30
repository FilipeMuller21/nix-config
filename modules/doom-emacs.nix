{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ emacs-pgtk git ripgrep fd ];
}
