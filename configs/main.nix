{ config, pkgs, lib, ... }:

{
  imports = [
    ./i3.nix
    ./polybar.nix
    ./rofi.nix
    ./alacritty.nix
    ./compton.nix
    ./vscode.nix
  ];

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    git = {
      enable = true;
      userName = "Martin Masson";
      userEmail = "martinmasson03" + "@" + "gmail.com";
    };

    zsh = {
      enable = true;
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.6.4";
            sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
          };
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
      ];
    };
  };

  xsession.enable = true;

}
