{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.common-gpu-nvidia-nonprime
  ];
}
