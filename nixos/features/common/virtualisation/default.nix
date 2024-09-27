{
  config,
  lib,
  pkgs,
  ...
}: let
  start = pkgs.writeScriptBin "start-script" ''
    #!/run/current-system/sw/bin/bash
    for i in $(ls /home);
      do echo $i;
      ${pkgs.psmisc}/bin/killall -u $i;
      kill -9 $(${pkgs.ps}/bin/ps -s -U $i | ${pkgs.gawk}/bin/awk '{print $2}' | ${pkgs.gnugrep}/bin/grep -Ev "pid");
    done
    systemctl stop greetd.service
    sleep 3
    for i in /sys/class/vtconsole/*;
      do echo 0 > $i/bind
    done
    echo "efi-framebuffer.0" > "/sys/bus/platform/drivers/efi-framebuffer/unbind"
  '';

  stop = pkgs.writeScriptBin "stop-script" ''
    #!/run/current-system/sw/bin/bash
    sleep 3
    echo "efi-framebuffer.0" > "/sys/bus/platform/drivers/efi-framebuffer/bind"
    systemctl start greetd.service
  '';
in {
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    extraConfig = ''
      log_filters="3:qemu 1:libvirt"
      log_outputs="2:file:/var/log/libvirt/libvirtd.log"
    '';
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      ovmf = {
        enable = true;
        packages = [pkgs.OVMFFull.fd];
      };
    };
    hooks.qemu = {
      script = pkgs.writeScript "script" ''
        #!/run/current-system/sw/bin/bash

        OBJECT="$1"
        OPERATION="$2"

        if [[ $OBJECT == "win10" ]]; then
        	case "$OPERATION" in
            "prepare")
              systemctl start libvirt-nosleep@"$OBJECT"  2>&1 | tee -a /var/log/libvirt/custom_hooks.log
              ${lib.getExe start} 2>&1 | tee -a /var/log/libvirt/custom_hooks.log
              ;;

              "release")
              systemctl stop libvirt-nosleep@"$OBJECT"  2>&1 | tee -a /var/log/libvirt/custom_hooks.log
              ${lib.getExe stop} 2>&1 | tee -a /var/log/libvirt/custom_hooks.log
              ;;
        	esac
        fi
      '';
    };
  };

  programs.virt-manager = {
    enable = true;
  };

  systemd.services."libvirt-nosleep@" = {
    enable = true;
    description = ''Preventing sleep while libvirt domain "%i" is running'';
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.systemd}/bin/systemd-inhibit --what=sleep --why="Libvirt domain \"%i\" is running" --who=%U --mode=block sleep infinity'';
    };
    unitConfig = {
      IgnoreOnIsolate = "yes";
    };
    wantedBy = ["multi-user.target"];
  };

  environment.systemPackages = [pkgs.virtiofsd];
}
