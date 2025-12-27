{ config, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = true;
  services.xserver.videoDriver = "modesetting";
  

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
 };

  hardware.graphics = {
    enable = true;
  };
 
  networking.hostName = "nixos-btw";  
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Sao_Paulo";


  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
  
  console.keyMap = "br-abnt2";
  
  users.users.sulw = {
    isNormalUser = true;
    description = "Sulw";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  
  nixpkgs.config.allowUnfree = true;

   programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };


  environment.systemPackages = with pkgs; [
   ani-cli
   alacritty
   btop
   bat
   discord
   firefox
   gamemode
   git
   hyprpaper
   kew
   mpv
   git
   ncpamixer
   neofetch
   pavucontrol
   qbittorrent-enhanced
   rofi
   unimatrix
   vim
   vlc
   vscode
   waybar
   xdg-user-dirs
   yazi
   wget
  ];
  

  system.stateVersion = "25.11"; # Did you read the comment?
  
}
