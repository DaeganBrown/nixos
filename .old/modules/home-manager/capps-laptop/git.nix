{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        # commit.gpgsign = true;
	gpg.format = "ssh";
	user = {
	  signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMf162Dbjzdky7s+o0eFzSAIcxzyRNp8A3/BqlANjW5z ketchupcapps@gmail.com";
	  email = "161258092+RockingCone@users.noreply.github.com";
	  name = "Capps";
	};
	init.defaultBranch = "main";
      };
    };
  };
}
