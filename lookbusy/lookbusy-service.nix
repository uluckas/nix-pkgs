{ pkgs, lib, config, localPkgs, ... }:
with lib;
let
  system = pkgs.hostPlatform.system;
  lookbusy = localPkgs.${system}.lookbusy;
  cfg = config.services.lookbusy;
in
{
  options.services.lookbusy = {
    enable = mkEnableOption "Enable the lookbusy service";
    flags = mkOption {
      type = types.str;
      default = "--cpu-util=\"10-20\" --cpu-mode=curve";
      description = "Flags to pass to the lookbusy service.";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.lookbusy = {
      description = "Lookbusy: A tool for keeping the systems busy";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${lookbusy}/bin/lookbusy ${cfg.flags}";
      };
    };
  };
}
