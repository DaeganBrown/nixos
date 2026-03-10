{ ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        # commit.gpgsign = true;
	gpg.format = "ssh";
	user = {
	  signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDotZKr4AiIHdA7QRGXZh2fUpdUy2VxuWyWUddnVIRFk 266811806+SpysiBrown@users.noreply.github.com";
	  email = "266811806+SpysiBrown@users.noreply.github.com";
	  name = "Spysi";
	};
	init.defaultBranch = "main";
      };
    };
  };
}
