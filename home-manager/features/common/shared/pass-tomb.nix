{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  home.packages = let
    pass-open = pkgs.writeScriptBin "pass-open" ''
      #!${pkgs.expect}/bin/expect -f

      # Make sure to wait for the prompt
      set timeout -1

      # Read the password from the file
      set password [exec gpg --quiet --decrypt ${inputs.secrets}/guxanan/password]

      # Start the application (e.g., sudo command)
      spawn pass open -f

      # Look for the password prompt
      expect "password for"

      # Send the password
      send "$password\r"

      # Interact with the application
      interact
    '';

    pass-close = pkgs.writeScriptBin "pass-close" ''
      #!${pkgs.expect}/bin/expect -f

      # Make sure to wait for the prompt
      set timeout -1

      # Read the password from the file
      set password [exec gpg --quiet --decrypt ${inputs.secrets}/guxanan/password]

      # Start the application (e.g., sudo command)
      spawn pass close -f

      # Look for the password prompt
      expect "password for"

      # Send the password
      send "$password\r"

      # Interact with the application
      interact
    '';
  in [pass-open pass-close];
}
