{
  config,
  lib,
  ...
}: {
  programs.thunderbird.settings = {
    # Basic defaults.
    "mailnews.default_sort_order" = 2;
    "mailnews.default_news_sort_order" = 2;
    "network.IDN_show_punycode" = true;

    # Disabling misc telemetry.
    "dom.security.unexpected_system_load_telemetry_enabled" = false;
    "network.trr.confirmation_telemetry_enabled" = false;

    # Disabling data reporting.
    "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
    "datareporting.healthreport.infoURL" = "";
    "datareporting.healthreport.uploadEnabled" = false;
    "datareporting.policy.dataSubmissionEnabled" = false;
    "datareporting.policy.firstRunURL" = "";

    # Disabling toolkit telemetry.
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.cachedClientID" = "";
    "toolkit.telemetry.dap_enabled" = false;
    "toolkit.telemetry.dap_helper" = "";
    "toolkit.telemetry.dap_helper_owner" = "";
    "toolkit.telemetry.dap_leader" = "";
    "toolkit.telemetry.dap_leader_owner" = "";
    "toolkit.telemetry.dap_task1_enabled" = false;
    "toolkit.telemetry.debugSlowSql" = false;
    "toolkit.telemetry.ecosystemtelemetry.enabled" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.geckoview.streaming" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.server" = "";
    "toolkit.telemetry.server_owner" = "";
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.shutdownPingSender.enabledFirstSession" = false;
    "toolkit.telemetry.testing.overrideProductsCheck" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
  };
}
