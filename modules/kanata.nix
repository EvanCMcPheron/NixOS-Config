{ config, pkgs, ... }:
{
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = ["/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          ;; Kanata configuration for caps to esc+ctrl

          (defsrc
            caps ins 
          )

          (defalias
            escctrl (tap-hold 100 150 esc lctrl)
          )

          (deflayer base
            @escctrl caps
          )
        '';
      };
    };
  };
}
