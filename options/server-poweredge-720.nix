{ ... }:

{
  imports = [ ./options.nix ];

  config = {
    hostName = "browncrashpad";
    searchEngine = "vivaldi";
    terminal = "kitty";
    theme = "tron";
    username = "admin";
  };
}
