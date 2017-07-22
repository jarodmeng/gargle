
#' Environment used for gargle global state.
#'
#' This environment contains:
#' * `$cred_funs` is the ordered list of credential methods to use when trying
#'   to fetch credentials.
#'
#' @format An environment.
#' @keywords internal
gargle_env <- new.env(parent = emptyenv())
gargle_env$cred_funs <- list()
