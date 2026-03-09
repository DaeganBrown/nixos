{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        # commit.gpgsign = true;
	gpg.format = "ssh";
	user = {
	  signingkey = "";
	  email = "";
	  name = "";
	};
	init.defaultBranch = "main";
      };
    };
  };
}
