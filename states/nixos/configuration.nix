{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./fonts.nix
      ./yubikey.nix
    ];

  fileSystems."/".options = [ "noatime" "nodiratime" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.cleanTmpDir = true;

  networking.hostName = "P4X-D-NixOS";
  networking.networkmanager.enable = true;

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 14d";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    alacritty
    chromium
    docker_compose
    firefox
    fzf
    git
    gnome3.dconf
    gnome3.vte
    gnupg
    google-cloud-sdk
    i3lock
    kbfs
    keybase
    kubectl
    kubernetes-helm
    minikube
    nerdfonts
    pamix
    pinentry_ncurses
    rofi
    slack
    terraform
    tilix
    vim
    vlc
    wget
    zsh
  ];

  programs.bash.enableCompletion = true;

  services.keybase.enable = true;
  services.kbfs.enable = true;
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.gnupg.agent.enable = false;

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";

    videoDrivers = ["nvidia"];

    desktopManager = {
      default = "xfce";
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };

    libinput = {
      enable = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  users.groups.rawkode = {};

  users.users.rawkode =
  { isNormalUser = true;
    home = "/home/rawkode";
    description = "David McKay";
    extraGroups = [ "rawkode" "audio" "disk" "docker" "networkmanager" "plugdev" "wheel" ];
    shell = "/run/current-system/sw/bin/zsh";
  };

  virtualisation = {
    virtualbox.host = {
      enable = true;
      enableHardening = false;
      addNetworkInterface = true;
    };

    docker = {
      enable = true;
      storageDriver = "devicemapper";
    };
  };

  system.stateVersion = "18.03";
}
