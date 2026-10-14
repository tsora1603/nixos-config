{ lib, pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;

      shellAliases = {
        ls = "eza --icons";
        ll = "eza --icons -l --git --group-directories-first --time-style long-iso";
        la = "eza --icons -la";
        lt = "eza --icons --tree";
      };

      shellAbbrs = {
        "ns" = "nh os switch";
        "nt" = "nh os test";
        "nx" = "cd ~/nixos";
        "nh" = "cd ~/nixos/home";
        "sn" = "sudo nano";
        "sx" = "sudo nano ~/nixos/configuration.nix";        
      };

      interactiveShellInit = ''
        set -g fish_prompt_pwd_dir_length 0
        set -g fish_transient_prompt 1
        set -g __fish_git_prompt_show_informative_status true

        set fish_greeting ""
      '';
    };
  };  

  xdg.configFile = {
    "fish/functions" = { source = ./fish/functions; recursive = true; };
  };
}
