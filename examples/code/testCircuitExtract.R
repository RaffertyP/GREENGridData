#--- Runs the circuit extract analysis ---#

# Assumes that you have run extractCircuitFromCleanGridSpy1min.R first !!

# Load nzGREENGrid package ----
library(GREENGridData) # local utilities

# Packages needed in this .Rmd file ----
rmdLibs <- c("data.table", # data munching
             "lubridate", # date & time stuff
             "ggplot2", # for fancy graphs
             "readr", # for reading & parsing .csv files
             "rmarkdown", # for render
             "bookdown", # for html2
             "kableExtra" # for pretty kable
)
# load them
loadLibraries(rmdLibs)

# Local parameters ----

# use circuit parameter to change the circuit used (assumes you have already extracted it)
circuit <- "Freezer" # change this to change the circuit(s) to be analysed

# change this to suit your data location - this is where extractCleanGridSpy1minCircuit.R saved your extract
dPath <- "/Volumes/hum-csafe/Research Projects/GREEN Grid/" # Otago HCS
oPath <- paste0(dPath, "cleanData/safe/gridSpy/1min/dataExtracts/")

gsFile <- paste0(oPath,
                circuit, # change the circuit and you change the data used :-)
                 "_2015-04-01_2016-03-31_observations.csv.gz")

# test file exists
if(file.exists(gsFile)){
  message("Success! Found expected pre-extracted file: ", gsFile)
} else {
  message("Opps. Didn't find expected pre-extracted file: ", gsFile)
  stop("Please check you have set the paths and filename correctly...")
}

# where you saved the household attributes file
hhFile <- paste0(dPath, "cleanData/safe/survey/ggHouseholdAttributesSafe.csv")
# test file exists
if(file.exists(hhFile)){
  message("Success! Found expected pre-extracted file: ", gsFile)
} else {
  message("Oops. Didn't find expected pre-extracted file: ", gsFile)
  stop("Please check you have set the paths and filename correctly...")
}

# --- Build report ----

# NB this will fail if you do not have access to the data and/or an extract that matches <circuit> from https://dx.doi.org/10.5255/UKDA-SN-853334

rmdFile <- paste0(ggrParams$repoLoc, "/examples/code/testCircuitExtract.Rmd")
rmarkdown::render(input = rmdFile,
                  output_format = "html_document2",
                  params = list(circuit = circuit, gsFile = gsFile, hhFile = hhFile),
                  output_file = paste0(ggrParams$repoLoc,"/examples/outputs/testCircuitExtract_", circuit, ".html")
)
