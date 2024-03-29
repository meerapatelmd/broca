% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/excel.R
\name{write_temp_xlsx}
\alias{write_temp_xlsx}
\title{Write a List of Dataframes as a Temporary Excel}
\usage{
write_temp_xlsx(x, asTable = FALSE, ..., log = "DEPRECATED", log_details = "")
}
\arguments{
\item{x}{A data.frame or a (named) list of objects that can be handled by
\code{\link[openxlsx]{writeData}} or \code{\link[openxlsx]{writeDataTable}} to write to file}

\item{asTable}{If \code{TRUE} will use \code{\link[openxlsx]{writeDataTable}} rather
than \code{\link[openxlsx]{writeData}} to write \code{x} to the file (default: 
\code{FALSE})}

\item{...}{Additional arguments passed to \code{\link[openxlsx]{writeData}}, 
\code{\link[openxlsx]{writeDataTable}}, \code{\link[openxlsx]{setColWidths}}}

\item{log}{(Deprecated) Log this function call to a log.md file?}

\item{log_details}{(Deprecated) If log is TRUE, additional notes to include with the log entry.}
}
\description{
Write a temporary Excel file using \code{\link[openxlsx]{write.xlsx}}. The Path to the file is returned.
}
\seealso{
Other write functions: 
\code{\link{write_full_excel}()}

Other excel functions: 
\code{\link{is_excel}()},
\code{\link{read_full_excel}()},
\code{\link{write_full_excel}()}
}
\concept{excel functions}
\concept{write functions}
