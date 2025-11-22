{ config, inputs, ...}: {
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;
    profiles."default" = {
      isDefault = true;
      userChrome = builtins.readFile "${config.programs.matugen.theme.files}/.config/zen/userChrome.css";
      userContent = builtins.readFile "${config.programs.matugen.theme.files}/.config/zen/userContent.css";
    };
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      DNSOverHTTPS.Enabled = false;
    };
  };
}
