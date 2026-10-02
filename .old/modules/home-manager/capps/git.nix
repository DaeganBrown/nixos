{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        # commit.gpgsign = true;
	gpg.format = "ssh";
	user = {
	  signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL1/1WuACbsEqL7dNxiaJu0vL/zU/YFQkHYt8LNkqVOj 161258092+RockingCone@users.noreply.github.com";
	  email = "161258092+RockingCone@users.noreply.github.com";
	  name = "Capps";
	};
	init.defaultBranch = "main";
      };
    };
  };
}
