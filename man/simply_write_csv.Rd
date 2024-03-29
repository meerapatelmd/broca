% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/csv.R
\name{simply_write_csv}
\alias{simply_write_csv}
\title{Write to CSV}
\usage{
simply_write_csv(
  x,
  file,
  na = "",
  append = FALSE,
  col_names = !append,
  quote_escape = "double",
  eol = "\\n",
  log = "DEPRECATED",
  log_details = ""
)
}
\arguments{
\item{x}{A data frame or tibble to write to disk.}

\item{file}{File or connection to write to.}

\item{na}{String used for missing values. Defaults to NA. Missing values
will never be quoted; strings with the same value as \code{na} will
always be quoted.}

\item{append}{If \code{FALSE}, will overwrite existing file. If \code{TRUE},
will append to existing file. In both cases, if the file does not exist a new
file is created.}

\item{col_names}{If \code{FALSE}, column names will not be included at the top of the file. If \code{TRUE},
column names will be included. If not specified, \code{col_names} will take the opposite value given to \code{append}.}

\item{quote_escape}{\Sexpr[results=rd, stage=render]{lifecycle::badge("deprecated")}, use the \code{escape} argument instead.}

\item{eol}{The end of line character to use. Most commonly either \code{"\n"} for
Unix style newlines, or \code{"\r\n"} for Windows style newlines.}
}
\description{
Wrapper to \code{\link[readr]{write_csv}}.
}
\seealso{
Other csv functions: 
\code{\link{is_csv}()},
\code{\link{read_csv_as_rmd_table}()},
\code{\link{simply_read_csv}()},
\code{\link{write_temp_csv}()}
}
\concept{csv functions}
