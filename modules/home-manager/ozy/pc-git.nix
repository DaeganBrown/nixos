{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        # commit.gpgsign = true;
	gpg.format = "ssh";
	user = {
	  signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIRJfMCLvYobU3bp0q43zUSafHpB6sOqasx8A1wZCE/p 149893841+DaeganBrown@users.noreply.github.com";
	  email = "149893841+DaeganBrown@users.noreply.github.com";
	  name = "Ozymandias";
	};
	init.defaultBranch = "main";
      };
    };
  };
}
