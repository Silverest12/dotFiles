{ config, pkgs, lib, ... }:

let
  fzfConfig = ''
    set -x FZF_DEFAULT_OPTS "--preview='bat {} --color=always'" \n
    set -x SKIM_DEFAULT_COMMAND "rg --files || fd || find ."
  '';

  #customPlugins = pkgs.callPackage ./plugins.nix {};

  fenv = {
    name = "foreign-env";
    src = pkgs.fishPlugins.foreign-env.src;
  };

  fishConfig = ''
    bind \t accept-autosuggestion 
  '' + fzfConfig; 
in
{
  programs.fish = {
    enable = true;
    plugins = [ fenv ];

    promptInit = ''
      eval (direnv hook fish)
      neofetch
    '';
    shellAliases = {
      ll   = "ls -a";
      ".." = "cd ..";
      ping = "prettyping";
    };
    shellInit = fishConfig;
  };
}