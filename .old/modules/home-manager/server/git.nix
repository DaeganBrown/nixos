{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        # commit.gpgsign = true;
	      gpg.format = "ssh";
	      user = {
	        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmVf0/UzCA7sEiSKZ5gNihlcq6mb1jpU8NSPCPxjCNG 149893841+DaeganBrown@users.noreply.github.com";
	        email = "149893841+DaeganBrown@users.noreply.github.com";
	        name = "Browncrashpad";
	      };
	    init.defaultBranch = "main";
      };
    };
  };
}
