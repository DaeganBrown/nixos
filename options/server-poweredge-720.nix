{ ... }:

{
  imports = [ ./options.nix ];

  config = {
    hostname = "browncrashpad";
    search_engine = "vivaldi";
    terminal = "kitty";
    theme = "tron";
    username = "admin";
  };
}
