{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        commit.gpgsign = true;
	gpg.format = "ssh";
	user = {
	  signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLxsbOscVdGqK7IaaJgld2FRYFwbsncG89ahrK90fBj 149893841+DaeganBrown@users.noreply.github.com";
	  email = "149893841+DaeganBrown@users.noreply.github.com";
	  name = "Ozymandias";
	};
	init.defaultBranch = "main";
      };
    };
  };
}
