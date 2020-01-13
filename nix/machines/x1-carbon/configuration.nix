{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" ];
  boot.kernelModules = [ "kvm-intel" ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };

    cleanTmpDir = true;
  };

  services.hardware.bolt.enable = true;
  services.tlp.enable = true;

  i18n = {
    defaultLocale = "en_GB.UTF-8";
  };

  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;
    };

    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  hardware.bluetooth.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    useSandbox = true;

    package = pkgs.nixUnstable;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile.
  environment.gnome3.excludePackages = with pkgs.gnome3; [ gnome-software ];

  environment.systemPackages = (with pkgs; [
    gnome3.dconf
    gnome3.vte
  ]);

  services.udev.packages = [ pkgs.libu2f-host ];
  services.udev.extraRules = ''
# Notify ModemManager this device should be ignored
ACTION!="add|change|move", GOTO="mm_usb_device_blacklist_end"
SUBSYSTEM!="usb", GOTO="mm_usb_device_blacklist_end"
ENV{DEVTYPE}!="usb_device",  GOTO="mm_usb_device_blacklist_end"

ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", ENV{ID_MM_DEVICE_IGNORE}="1"

LABEL="mm_usb_device_blacklist_end"


# Solo bootloader + firmware access
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess"
SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess"

# ST DFU access
SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", TAG+="uaccess"

# U2F Zero
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="8acf", TAG+="uaccess"
  '';

  environment.interactiveShellInit = ''
    if [[ "$VTE_VERSION" > 3405 ]]; then
      source "${pkgs.gnome3.vte}/etc/profile.d/vte.sh"
    fi
  '';

  fonts = {
    enableFontDir = true;

    fonts = with pkgs; [
      cascadia-code
      corefonts
      emojione
      google-fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Cascadia Code" ];
        sansSerif = [ "Bitter" ];
        serif     = [ "Bitter" ];
      };
    };
  };

  services.printing.enable = true;
  services.pcscd.enable = true;

  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  };

  console.useXkbConfig = true;

  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome3.gnome-keyring.enable = true;

  services.xserver = {
    enable = true;

    layout = "us";
    xkbVariant = "altgr-intl";

    displayManager = {
      defaultSession = "gnome";

      gdm = {
        enable = true;
        wayland = true;
      };
    };

    desktopManager = {
      gnome3.enable = true;
    };

    libinput = {
      enable = true;

      # This only applies to the trackpad, need to check if we
      # can find a way to do this for mice too.
      naturalScrolling = true;
      scrollMethod = "twofinger";
      tapping = true;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  users.groups.rawkode = {};

  users.users.rawkode = {
    isNormalUser = true;
    home = "/home/rawkode";
    description = "David McKay";
    extraGroups = [ "rawkode" "audio" "disk" "docker" "networkmanager" "plugdev" "wheel" ];
    shell = pkgs.zsh;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;

  nix.trustedUsers = ["rawkode"];

  system.stateVersion = "19.09";
}
