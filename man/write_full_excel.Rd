% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/excel.R
\name{write_full_excel}
\alias{write_full_excel}
\title{Write a List of Dataframes as an Excel}
\usage{
write_full_excel(
  x,
  file,
  asTable = FALSE,
  ...,
  log = "DEPRECATED",
  log_details = ""
)
}
\arguments{
\item{x}{object or a list of objects that can be handled by \code{\link[openxlsx]{writeData}} to write to file}

\item{file}{File path.}

\item{asTable}{write using writeDataTable as opposed to writeData}

\item{...}{optional parameters to pass to functions:
\itemize{
  \item{createWorkbook}
  \item{addWorksheet}
  \item{writeData}
  \item{freezePane}
  \item{saveWorkbook}
}

see details.}

\item{log}{(Deprecated) Log this function call to a log.md file?}

\item{log_details}{(Deprecated) If log is TRUE, additional notes to include with the log entry.}
}
\description{
Write an Excel file using \code{\link[openxlsx]{write.xlsx}}.
}
\seealso{
\code{\link[openxlsx]{write.xlsx}}

Other write functions: 
\code{\link{write_temp_xlsx}()}

Other excel functions: 
\code{\link{is_excel}()},
\code{\link{read_full_excel}()},
\code{\link{write_temp_xlsx}()}
}
\concept{excel functions}
\concept{write functions}
