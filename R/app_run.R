
#' @export
run_test_app <- function() {

  if (interactive()) {

    shiny::runApp(appDir = system.file("app", package = "sstestapp"))

  } else {

    shiny::shinyAppDir(appDir = system.file("app", package = "sstestapp"))

  }

}
