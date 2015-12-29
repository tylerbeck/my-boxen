class projects::clicklist_web {

  # $projects: "${::user::project_root}"
  # $clicklist: "${projects}/clicklist_web"
  #
  # # setup ==============================================================
  #
  # # code ===============================================================
  # repository { $clicklist:
  #   source  => "http://${::kroger:euid}stash.kroger.com/scm/dcpw/clicklist_web.git",
  #   ensure  => 'origin/HEAD',
  # }
  #


}
