{ osConfig, ... }:

{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles."${osConfig.username}" = {
#      userChrome = ''
#         /* ── Readability overrides ── */
#
#         /* Tab text */
#         .tabbrowser-tab .tab-label {
#           color: #e0f4ff !important; /* base07 */
#         }
#
#         .tabbrowser-tab[selected] .tab-label {
#           color: #4fffff !important; /* base0C — cyan accent for active tab */
#         }
#
#         /* Context menus and dropdowns */
#         menupopup, .menupopup-drop-shadow {
#           color: #e0f4ff !important; /* base07 */
#           background-color: #0a1628 !important; /* base01 */
#         }
#
#         menuitem {
#           color: #e0f4ff !important;
#         }
#
#         menuitem:hover {
#           color: #4fffff !important; /* base0C */
#           background-color: #0d2137 !important; /* base02 */
#         }
# panel, .panel-arrowcontent, panelview,
# .panel-subview-body, toolbarbutton {
#   color: #e0f4ff !important;
# }
#
# panel description, panel label,
# panel .panel-header, panel h1,
# panel strong, panel p,
# .panel-arrowcontent description,
# .panel-arrowcontent label {
#   color: #e0f4ff !important;
# }
#
# panelview, .panel-arrowcontent {
#   background-color: #0a1628 !important;
# }
#
# .urlbarView, .urlbarView-row {
#   color: #e0f4ff !important;
#   background-color: #0a1628 !important;
# }
#
# .urlbarView-row[selected],
# .urlbarView-row:hover {
#   color: #4fffff !important;
#   background-color: #0d2137 !important;
# }
#       '';
# userContent = ''
#         /* about:preferences text fixes */
#         @-moz-document url-prefix("about:preferences"),
#                         url-prefix("about:settings") {
#           body, #mainPrefPane, .pane-container {
#             color: #e0f4ff !important;
#             background-color: #010b13 !important;
#           }
#
#           /* Section headers like "Compact Mode", "Workspaces" */
#           h2, groupbox > label, .search-header,
#           .subcategory, caption {
#             color: #4fffff !important;
#           }
#
#           /* General label text */
#           label, description, .label-inline {
#             color: #e0f4ff !important;
#           }
#
#           /* Left nav items */
#           .category-name {
#             color: #e0f4ff !important;
#           }
#
#           .category[selected] .category-name {
#             color: #4fffff !important;
#           }
#
#           /* Input fields */
#           input, select {
#             color: #e0f4ff !important;
#             background-color: #0a1628 !important;
#             border-color: #1a3a5c !important;
#           }
#
#           /* Buttons */
#           button {
#             color: #e0f4ff !important;
#             background-color: #0d2137 !important;
#             border-color: #1a3a5c !important;
#           }
#
#           button:hover {
#             background-color: #1a3a5c !important;
#             color: #4fffff !important;
#           }
#         }
#       '';
    };
  };
  xdg.mimeApps = {
      enable = true;
      defaultApplications = let
        zen = "zen-beta.desktop"; # or zen.desktop / zen-twilight.desktop, matches the .desktop filename
      in {
        "text/html" = zen;
        "x-scheme-handler/http" = zen;
        "x-scheme-handler/https" = zen;
        "x-scheme-handler/about" = zen;
        "x-scheme-handler/unknown" = zen;
        "application/xhtml+xml" = zen;
      };
    };
}
