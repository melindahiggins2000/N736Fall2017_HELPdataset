* ==========================================;
* N736 Lesson 08 - 09/20/2017
*
* Univariate/Bivariate Stats
* working with the HELP dataset
* ==========================================;

* create a library - change to your directory
* where you have downloaded the help.sas7bdat dataset;
LIBNAME L8 'C:\MyGithub\N736Fall2017_lesson08';

* make a copy in the WORK library;
DATA work.help;
  SET L8.help;
  RUN;

* get univariate stats
  add a qqplot
  and run normality tests;
proc univariate data=help plots normaltest;
  var age;
  histogram age / normal;
  qqplot age;
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

* ==================================
  continuous - continuous
  compute correlations
  ==================================;

proc corr data=help;
  var age cesd pcs mcs;
  run;

proc corr data=help pearson spearman kendall
  plots(maxpoints=10000)=matrix(histogram);
  var age cesd pcs mcs;
  run;

* ==================================
  continuous - categorical (2-levels)
  compute correlations and
  compare to t-test and Mann Whitney
  tests
  ==================================;

proc corr data=help;
  var female age cesd;
  run;

proc ttest;
  class female;
  var age cesd;
  run;

proc npar1way;
  class female;
  var age cesd;
  run;

* ==================================
  categorical - categorical
  chi-square test and fisher's 
  exact tests
  ==================================;

proc freq data=help;
  tables female*racegrp / 
    expected norow nopercent chisq fisher plots=freqplot;
  run;



