# NZ GREEN Grid Household Electricity Demand Study: Data R Package

## Example code

The code in this folder provides example R/Rmd code for simple extraction and analysis of the cleaned [safe project data](http://reshare.ukdataservice.ac.uk/853334/). To use the code you will need to:

 * [register](https://beta.ukdataservice.ac.uk/myaccount/credentials) to use and download the [data](http://reshare.ukdataservice.ac.uk/853334/);
 * install and also download the [cleaned data package](https://github.com/CfSOtago/GREENGridData);
 * adjust the file paths to suit your local setup before running the code. 
 
 The code makes extensive use of package functions so make sure you install it first. You may need to look at the [package function code](../R/) to understand what these do.

Code examples include:

 * **testHouseholdCleanGridSpy1min.R** - R script which runs the .Rmd file of the same name with parameters to load a given household's Grid Spy data file and creates a mean power (W) profile plot for all circuits by year and month - very useful for data checking. It also shows how to link the Grid Spy data to the households attribute data;
 * **extractCircuitFromCleanGridSpy1min.R** - searches across the safe Grid Spy data for a given string in the circuit labels between two dates (inclusive). It saves the results as a .csv.gz file. Has been tested for 'Heat Pump' and 'Hot Water'. This code is best run from the command line e.g. using `> Rscript extractCleanGridSpy1minCircuit.R` (more info on [Rscript](https://www.rdocumentation.org/packages/utils/versions/3.5.1/topics/Rscript));
 * **testCircuitExtract.R** - R script which runs the .Rmd file of the same name with parameters to use pre-extracted `circuit` circuit data (created using the above `extractCleanGridSpy1minCircuit.R` script) and the household attribute data to conduct basic analysis of electricity demand.
 * **codeHouseholdAttributes.R** - coding of household (category) variables
 * **testHouseholdAttributes.R** - test analysis of household (category) variables

There are also some .Rmd examples which test the results of the data extraction and processing.

You can probably find better (and quicker) ways to do these. #YMMV.

## Known issues

We keep a log of [issues](https://github.com/dataknut/nzGREENGridDataR/issues?q=is%3Aissue+label%3Aexamples) - if you detect a new problem with the data (or code) please open a new [issue](https://github.com/dataknut/nzGREENGridDataR/issues?q=is%3Aissue+label%3Aexamples).


