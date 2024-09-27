{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      #for passthrough
      "video=efifb:off"
      "amd_iommu=on"
      "iommu=pt"

      # disabling watchdog
      "modprobe.blacklist=sp5100_tco"
      "nowatchdog"

      # enabling pstate
      "amd_pstate=active"
      "initcall_blacklist=acpi_cpufreq_init"
    ];
  };

  networking = {
    hostName = "skuld";
    networkmanager.enable = true;
  };

  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = lib.mkDefault "ja_JP.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "ro_RO.UTF-8/UTF-8"
      "it_IT.UTF-8/UTF-8"
    ];
  };

  location.provider = "geoclue2";
  time.timeZone = lib.mkDefault "Europe/Rome";

  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };

  console = {
    useXkbConfig = true;
    earlySetup = false;
  };

  security.sudo = {
    execWheelOnly = true;
    extraConfig = ''
      # rollback results in sudo lectures after each reboot
      Defaults lecture = never
    '';
  };

  services.udev = {
    extraHwdb = ''
      evdev:name:SONiX USB DEVICE Keyboard:*
       KEYBOARD_KEY_c0401=!reserved
    '';
  };

  system.stateVersion = "24.05";
}
