# Needs system scope because services are system scoped ig
{ inputs, ... }:
{
  imports = [ inputs.ambxst.nixosModules.default ];
  programs.ambxst.enable = true;        # module already mkDefaults this to true
  programs.ambxst.fonts.enable = true;
  programs.gpu-screen-recorder.enable = true;
}
