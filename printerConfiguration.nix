{ config, pkgs, ... }: {

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  # boot.loader.raspberryPi.enable = true;
  # boot.loader.raspberryPi.version = 0;
  # boot.loader.raspberryPi.uboot.enable = true;

  # nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    # pkgs.
  ];

  boot.kernelPackages = pkgs.linuxPackages_4_19;

  networking.hostName = "printer"; # Define your hostname.
  networking.wireless.enable =
    true; # Enables wireless support via wpa_supplicant.
  networking.wireless.networks."internet xD".psk = "QwerFdsa";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  users.users.print = {
    isNormalUser = true;
    description = "printer";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [  ];
    shell = pkgs.nushell;
  };

  # environment.systemPackages = with pkgs; [
  # hello
  # ];
  # environment.shells = with pkgs; [ nushell ];
  # services.avahi.enable = true;
  # services.avahi.nssmdns = true;

  # services.openssh.enable = true;

  system.stateVersion = "22.11";

}
