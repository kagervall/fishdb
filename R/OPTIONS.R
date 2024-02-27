##
## This file contains code needed to read and process Spöreg data exported
## from Oracle with the APEX interface.
##

## FishDB options ##################################################################################
# Variable, global to package's namespace.
# This function is not exported to user space and does not need to be documented.
OPTIONS <- settings::options_manager(
  dbname = "fishdb",
  host = "193.10.96.167",
  port = 5432,
  user = "readonly",
  password="readonly",
  use_latin1 = FALSE)
 



# User function that gets exported:

#' Set or get options for reading APEX Spöreg data
#'
#' @param ... Option names to retrieve option values or \code{[key]=[value]} pairs to set options.
#'
#' @section Supported options:
#' The following options are supported
#' \itemize{
#'  \item{\code{dbname} Name of database (Default: fishdb)}
#'  \item{\code{host} Name or ip-number (Default: 193.10.96.167)}
#'  \item{\code{port} Port-number (Default: 5432)}
#'  \item{\code{user} Username in database (Default: readonly)}
#'  \item{\code{password} Password for user (Default: readonly)}
#'  \item{\code{use_latin1} Switch client to latin1 (Default: FALSE)}
#' }
#'
#' @export
fishdb_options <- function(...){
  # protect against the use of reserved words.
  settings::stop_if_reserved(...)
  OPTIONS(...)
}

