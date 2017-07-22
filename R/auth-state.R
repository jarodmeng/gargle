
auth_activate <- function() {
  gargle_env$auth$active <- TRUE
  auth_status()
}

auth_deactivate <- function(clear = FALSE) {
  gargle_env$auth$active <- FALSE
  if (clear) {
    if (inherits(token, "Token2.0") &&
        !is.null(token$cache_path) &&
        file.exists(token$cache_path)) {
      message("TO DO: should deactivate cache file right here")
    }
    gargle_env$auth$token <- NULL
    gargle_env$auth$method <- NULL
  }
  auth_status()
}

auth_status <- function() {
  cat("auth: ",
      if (gargle_env$auth$active) "ACTIVE" else "INACTIVE", "\n",
      "token state: ",
      if (is.null(gargle_env$auth$token)) "NULL" else "CACHED", "\n",
      "last credential method: ", gargle_env$auth$method,
      sep = ""
  )
  invisible(gargle_env$auth)
}
