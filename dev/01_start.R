#
#
#
golem::fill_desc(
  pkg_name = "dashboard.CRAS.Maringa",
  pkg_title = "Dashboard CRAS Maringá",
  pkg_description = "PKG_DESC.",
  authors = person(
    given = "Daniel Alexandre",
    family = "Ramazzotte",
    email = "ra132955@gmail.com",
    role = c("aut", "cre")
  ),
  repo_url = "https://github.com/Daniel-Alexandre-Ramazzotte/dashboard-CRAS-Maringa",
  pkg_version = "0.0.0.9000",
  set_options = TRUE
)
golem::install_dev_deps()
usethis::use_mit_license("Golem User")
golem::use_readme_rmd(open = FALSE)
devtools::build_readme()
usethis::use_code_of_conduct(contact = "Golem User")
usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md(open = FALSE)
golem::use_recommended_tests()
golem::use_favicon()
golem::use_utils_ui(with_test = TRUE)
golem::use_utils_server(with_test = TRUE)
usethis::use_git()
usethis::use_git_remote(
  name = "origin",
  url = "https://github.com/<OWNER>/<REPO>.git"
)
rstudioapi::navigateToFile("dev/02_dev.R")
