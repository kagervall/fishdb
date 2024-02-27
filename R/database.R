
#' Connect to the Fishdb database
#'  
#' Uses connection parameters from `fishdb_options()`
#' @return a connection object
#' @export
#'
#' @examples
#' \dontrun{
#' con <- fishdata_connect()
#'}
#'
fishdb_connect <- function() {

  dbname <- fishdb_options()$dbname
  host <- fishdb_options()$host
  port <- fishdb_options()$port
  user <- fishdb_options()$user
  password <- fishdb_options()$password
  use_latin1 <- fishdb_options()$use_latin1
  
  
  con <- DBI::dbConnect(
    RPostgres::Postgres(), dbname=dbname, host=host, port=port,
    user=user, password=password)
  if (use_latin1) {
      DBI::dbExecute(con, "SET client_encoding = 'windows-1252'");
  }
  return(con)
}


#' Disconnect from FishDB
#'
#' @param con 
#'
#' @return fishdata_disconnect() retuns TRUE invisibly.
#' @export
#'
#' @examples
#' fishdb_disconnect(con)
#' 
fishdb_disconnect <- function(con) {
  if (!DBI::dbIsValid(con)) { stop("invalid connection parameter") }
  DBI::dbDisconnect(con)
  return(invisible(TRUE))
}

#' #' Latest SERS update date
#' #'
#' #' @param con a valid connection to SERS
#' #'
#' #' @return
#' #' The latest registration date in table sers.elfisken
#' #' @export
#' #'
#' #' @examples
#' #' \dontrun{
#' #' con <- sers_connect()
#' #' latest_date <- sers_latest_regdatum(con)
#' #' }
#' sers_latest_regdatum <- function(con) {
#'   if (!DBI::dbIsValid(con)) {
#'     stop("invalid connection parameter")
#'   }
#'   res <- DBI::dbGetQuery(conn = con, "select max(regdatum) as d from sers.elfisken")
#'   return(as.Date(format(res$d, tz = ""))) # use local timezone
#' }
