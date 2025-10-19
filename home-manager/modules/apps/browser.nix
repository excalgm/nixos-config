{
  programs.zen-browser = {
    enable = true;
    profiles."default" = {
      isDefault = true;
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
