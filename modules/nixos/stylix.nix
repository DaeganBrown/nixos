{ config, pkgs, ...}:

{
  stylix = {
    targets.mako.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.theme}.yaml";
    autoEnable = false;
    enable = true;
  };
}
