% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_flat_template.R
\name{add_additional}
\alias{add_additional}
\alias{add_minimal}
\alias{add_full}
\alias{add_flat_template}
\title{Add flat Rmd file that drives package development}
\usage{
add_additional(
  pkg = ".",
  dev_dir = "dev",
  flat_name = "additional",
  overwrite = FALSE,
  open = TRUE
)

add_minimal(
  pkg = ".",
  dev_dir = "dev",
  flat_name = "minimal",
  overwrite = FALSE,
  open = TRUE
)

add_full(
  pkg = ".",
  dev_dir = "dev",
  flat_name = "full",
  overwrite = FALSE,
  open = TRUE
)

add_flat_template(
  template = c("full", "minimal", "additional", "teaching", "dev_history"),
  pkg = ".",
  dev_dir = "dev",
  flat_name = template,
  overwrite = FALSE,
  open = TRUE
)
}
\arguments{
\item{pkg}{Path where to save file}

\item{dev_dir}{Name of directory for development Rmarkdown files. Default to "dev".}

\item{flat_name}{Name of the file to write in dev.
Use the name of the main function of your template to get chunks pre-filled with this function name.}

\item{overwrite}{Whether to overwrite existing flat Rmd template file with same name}

\item{open}{Logical. Whether to open file after creation}

\item{template}{Name of the template to use. See details.}
}
\value{
Create flat Rmd file(s) template(s) and return its (their) path
}
\description{
Add flat Rmd file that drives package development
}
\details{
Choose \code{template} among the different templates available:
\itemize{
\item "full": The full template with a reproducible package that can directly be inflated.
It comes along with the "dev_history" template. Default.
\item "minimal": Minimal template to start a new package when you already know {fusen}, along with the "dev_history" template.
\item "additional": Template for an additional vignette or set of additional functions.
\item "teaching": Template with a reproducible package, simpler than "full", but everything to
teach the minimal structure of a package.
\item "dev_history": Template with functions commonly used during package development.
This does not contain chunks to write your own functions.
}

Abbreviated names can also be used for the different templates:
"add" for additional, "min" for minimal, "teach" for teaching, "dev" for "dev_history".

\code{add_additional()}, \code{add_minimal()}, \code{add_full()} are wrapper around \code{add_flat_template("additional")}, ...
However, \code{add_dev_history()} is a deprecated function from a previous version.
}
\examples{
# Create a new project
dummypackage <- tempfile("dummypackage")
dir.create(dummypackage)

# Add
add_flat_template(template = "teaching", pkg = dummypackage)
# Delete dummy package
unlink(dummypackage, recursive = TRUE)

# For classical use in your package
\dontrun{
# first time ever using 'fusen'
add_flat_template("full")

# first time in your new package
add_flat_template("minimal")

# add new flat file for new functions
add_flat_template("add")

# add new flat template for teaching (a reduced full template)
add_flat_template("teaching")
}
}
