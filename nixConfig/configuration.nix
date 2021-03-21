# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # WM configs
      ./wm/xmonad.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 

  networking.hostName = "silverest"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  networking.useDHCP = false;
  networking.interfaces.enp2s0f1.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable sound.
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.silverest = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    home-manager
  ];


  fonts.fonts = with pkgs; [
    fira-code
    source-sans-pro
    jetbrains-mono
  ];

  programs.fish.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  services = {
      openssh = {
        enable = true;
        allowSFTP = true;
      };

      sshd.enable = true;
  };

  nix = {
    autoOptimiseStore = true;

    gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    extraOptions = ''
      keep-outputs     = true
      keep-derivations = true
    '';

    trustedUsers = [ "root" "silverest" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
