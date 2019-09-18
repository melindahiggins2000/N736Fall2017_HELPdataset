* ===========================================
  Check to make sure you have run helpformats01.sas
  first to create and apply the formats
  and the create the library "library"

  If you've already got the formats.sas7bcat
  created, you can run the LIBNAME statement
  again if needed, otherwise comment this code out
  or skip it
* ===========================================;

* ===========================================
  CHANGE the location of the DIRECTORY below
  to the location where your files are

  CREATE a link to your files called "library"
* ===========================================;

libname library 'C:\MyGithub\N736Fall2017_HELPdataset\' ;

* ===========================================
  In general it is a good idea to make a 
  copy of the original data - here I'm
  putting a copy into the WORK library.

  The rest of the code is then run in the WORK
  library (which is temporary) so the original
  file is left untouched.
* ===========================================;

* make a copy to WORK;
data help;
  set library.helpmkh;
  run;

* the formatting is now applied and should work
  check by running PROC FREQ or PROC CONTENTS;
proc freq data=help;
  tables female;
  run;

proc freq data=help;
  table f1a;
  run;

* see contents and formatting details
  and labelling;
proc contents data=help;
run;

* ===========================================
  Getting UNIVARIATE statistics
  PROC UNIVARIATE AND PROC MEANS are both helpful
* ===========================================;

* get univariate stats;
proc univariate data=help plots;
  var age;
  run;

* OPTIONAL
* can change the percentile algorithm
* default is PCTLDEF=5, but there are
* options 1,2,3,4 or 5 - see help for more details;

proc univariate data=help plots pctldef=1;
  var age;
  run;

* try algorithm 3;
  proc univariate data=help plots pctldef=3;
  var age;
  run;

* get univariate stats
* add histogram
* and overlay normal curve;
proc univariate data=help plots pctldef=1;
  var age;
  histogram age / normal;
  run;

* get other probability plots;
proc univariate data=help plots pctldef=1;
  var age;
  ppplot age;
  probplot age;
  qqplot age;
  run;

* get univariate stats
  add a qqplot
  and run normality tests;
proc univariate data=help plots normaltest;
  var age;
  histogram age / normal;
  qqplot age;
  run;

* TRY WITH OTHER VARIABLES;

* some plots - boxplot;
* to get a boxplot of 1 variable
* we have to create a dummy variable
* that is a constant, x=1, then we can use
* this variable to trick SAS into making 1 boxplot;

data help2;
  set help;
  x=1;
  run;

proc boxplot data=help2;
  plot age*x;
  run;

* boxplot of age by racegrp
* using proc sgplot and VBOX option;
PROC SGPLOT DATA=help;
  VBOX age / category = racegrp;
RUN;

* can change the percentile method if you want;
PROC SGPLOT DATA=help;
  VBOX age / category = racegrp percentile=3;
RUN;

* other summaries;
proc means data=help;
  var age;
  run;

* ages by race;
proc means data=help;
  var age;
  class racegrp;
  run;

* get summary stats
  for multiple vars;
proc means data=help n min max mean std median q1 q3;
  var age cesd pcs mcs;
  run;

* get summary stats
  by gender female;
proc means data=help n min max mean std median q1 q3;
  var age cesd pcs mcs;
  class female;
  run;

* categorical data;
proc freq data=help;
  tables racegrp / plots=freqplot;
  run;


