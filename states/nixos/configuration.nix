{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./fonts.nix
      ./yubikey.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    wget vim firefox chromium kubectl keybase kbfs google-cloud-sdk terraform kubernetes-helm slack zsh git gnupg minikube
  ];

  programs.bash.enableCompletion = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  services.keybase.enable = true;
  services.kbfs.enable = true;
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

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

    windowManager.i3.enable = true;

    libinput = {
      enable = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  users.users.rawkode =
  { isNormalUser = true;
    home = "/home/rawkode";
    description = "David McKay";
    extraGroups = [ "audio" "disk" "docker" "networkmanager" "plugdev" "wheel" ];
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
