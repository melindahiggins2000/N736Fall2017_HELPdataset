# README
Melinda K. Higgins, PhD.  
September 27, 2017  



# N736Fall2017_HELPdataset

N736 Fall 2017 - Details and Supporting Files and Code for HELP dataset

**Data - Basic Data - No Formatting - No Codebook**

* `help.csv` is the RAW basic file with all of the data. This file does NOT have any labels or "codes" defined; i.e. not "formatting" applied

* `help.RData` is the basic data file in a binary format readable by `R`; you can load this into `R` by simply running `load("help.RData")`. This "loads" the data.frame `helpdata` into your Global Environment in `R`.

* `help.sav` is the basic data file in SPSS format. However, this does NOT have any labelling - there is no codebook for this version of the data.

**Data - With Formatting - With a Codebook**

* `helpmkh.sav` is the SPSS formatted datafile WITH the codebook applied - all of the items have labels and where applicable the responses have labels also (i.e. the "codes" and "labels").

* `helpmkh.RData` is the dataset WITH Labels applied in a binary format readable by `R`; you can load this into `R` by simply running `load("helpmkh.RData")`. This "loads" the data.frame `help.spss` into your Global Environment in `R`. The object `help.spss` indicates that this data was read in from the SPSS formatted file WITH the codebook applied - thus the `attributes()` for the variables in this dataset will have labels and "factors" with codes and labels applied.

* `helpmkh.sas7bdat` along with the SAS program `helpmkh.sas` creates the `formats.sas7bcat` formats catalog. Together these help you "apply" the codebook formats to the dataset in `SAS`.

**`R` and `SAS` CODE to get you started**

* `loadHELPdata.R` - use this R script to load the HELP dataset with the codebook applied - this has the variable labels and coded levels

* `loadHELPdata.sas` - run this SAS program AFTER running `helpmkh.sas` to get the dataset into your WORK library.

## Variables in HELP dataset 

### Variable List and Item Labels

All variables are listed below except for `racegrp` and `substance` which are character type variables. These are listed in the next section below. For this table, all variable names, labels and minimum and maximum values are listed (excluding missing data `NA`s).


               Item Label                                                                                       Minimum   Maximum
-------------  ----------------------------------------------------------------------------------------------  --------  --------
id             Subject ID                                                                                           1.0     470.0
treat          Randomization Group                                                                                  0.0       1.0
age            Age at baseline (in years)                                                                          19.0      60.0
female         Gender of respondent                                                                                 0.0       1.0
pss_fr         Perceived Social Support - friends                                                                   0.0      14.0
homeless       One or more nights on the street or shelter in past 6 months                                         0.0       1.0
a15a           Number of nights in overnigh shelter in past 6 months                                                0.0     180.0
a15b           Number of nights on the street in past 6 months                                                      0.0     180.0
d1             How many times hospitalized for medical problems (lifetime)                                          0.0     100.0
e2b            Number of times in past 6 months entered a detox program - Baseline                                  1.0      21.0
g1b            Experienced serious thoughts of suicide (last 30 days) - Baseline                                    0.0       1.0
i1             Average number of drinks (standard units) consumed per day (in past 30 days) - Baseline              0.0     142.0
i2             Maximum number of drinks (standard units) consumed per day (in past 30 days)                         0.0     184.0
pcs            SF36 Physical Composite Score - Baseline                                                            14.1      74.8
mcs            SF36 Mental Composite Score - Baseline                                                               6.8      62.2
f1a            CESD 1 - I was bothered by things that usually don't bother me                                       0.0       3.0
f1b            CESD 2 - I did not feel like eating; my appetite was poor                                            0.0       3.0
f1c            CESD 3 - I felt that I could not shake off the blues even with help from my family or friends        0.0       3.0
f1d            CESD 4 - I felt that I was just as good as other people                                              0.0       3.0
f1e            CESD 5 - I had trouble keeping my mind on what I was doing                                           0.0       3.0
f1f            CESD 6 - I felt depressed                                                                            0.0       3.0
f1g            CESD 7 - I felt that everything I did was an effort                                                  0.0       3.0
f1h            CESD 8 - I felt hopeful about the future                                                             0.0       3.0
f1i            CESD 9 - I thought my life had been a failure                                                        0.0       3.0
f1j            CESD 10 - I felt fearful                                                                             0.0       3.0
f1k            CESD 11 - My sleep was restless                                                                      0.0       3.0
f1l            CESD 12 - I was happy                                                                                0.0       3.0
f1m            CESD 13 - I talked less than usual                                                                   0.0       3.0
f1n            CESD 14 - I felt lonely                                                                              0.0       3.0
f1o            CESD 15 - People were unfriendly                                                                     0.0       3.0
f1p            CESD 16 - I enjoyed life                                                                             0.0       3.0
f1q            CESD 17 - I had crying spells                                                                        0.0       3.0
f1r            CESD 18 - I felt sad                                                                                 0.0       3.0
f1s            CESD 19 - I felt that people dislike me                                                              0.0       3.0
f1t            CESD 20 - I could not get going                                                                      0.0       3.0
cesd           CESD total score - Baseline                                                                          1.0      60.0
indtot         Inventory of Drug Use Consequences (InDue) total score - Baseline                                    4.0      45.0
drugrisk       Risk Assessment Battery (RAB) drug risk score - Baseline                                             0.0      21.0
sexrisk        Risk Assessment Battery (RAB) sex risk score - Baseline                                              0.0      14.0
satreat        Any BSAS substance abuse treatment at baseline                                                       0.0       1.0
drinkstatus    Use of alcohol post-detox                                                                            0.0       1.0
daysdrink      Time (in days) to first alcoholic drink post-detox                                                   0.0     270.0
anysubstatus   Use of any substance post-detox                                                                      0.0       1.0
daysanysub     Time (in days) to first use of any substance post-detox                                              0.0     268.0
linkstatus     Post-detox linkage to primary care                                                                   0.0       1.0
dayslink       Time (in days) to linkage to primary care                                                            2.0     456.0
e2b1           Number of times in past 6 months entered a detox program - 6mo                                       1.0      11.0
g1b1           Experienced serious thoughts of suicide (last 30 days) - 6mo                                         0.0       1.0
i11            Average number of drinks (standard units) consumed per day (in past 30 days) - 6mo                   1.0     216.0
pcs1           SF36 Physical Composite Score - 6mo                                                                 19.7      71.4
mcs1           SF36 Mental Composite Score - 6mo                                                                    6.7      69.9
cesd1          CESD total score - 6mo                                                                               0.0      56.0
indtot1        Inventory of Drug Use Consequences (InDue) total score - 6mo                                         0.0     121.0
drugrisk1      Risk Assessment Battery (RAB) drug risk score - 6mo                                                  0.0      19.0
sexrisk1       Risk Assessment Battery (RAB) sex risk score - 6mo                                                   0.0      15.0
pcrec1         Number of primary care visits in past 6 months - 6mo                                                 0.0       2.0
e2b2           Number of times in past 6 months entered a detox program - 12mo                                      1.0       7.0
g1b2           Experienced serious thoughts of suicide (last 30 days) - 12mo                                        0.0       1.0
i12            Average number of drinks (standard units) consumed per day (in past 30 days) - 12mo                  1.0     115.0
pcs2           SF36 Physical Composite Score - 12mo                                                                14.4      68.9
mcs2           SF36 Mental Composite Score - 12mo                                                                  11.6      64.8
cesd2          CESD total score - 12mo                                                                              0.0      59.0
indtot2        Inventory of Drug Use Consequences (InDue) total score - 12mo                                        0.0     114.0
drugrisk2      Risk Assessment Battery (RAB) drug risk score - 12mo                                                 0.0      21.0
sexrisk2       Risk Assessment Battery (RAB) sex risk score - 12mo                                                  0.0      13.0
pcrec2         Number of primary care visits in past 6 months - 12mo                                                0.0       2.0
e2b3           Number of times in past 6 months entered a detox program - 18mo                                      1.0      13.0
g1b3           Experienced serious thoughts of suicide (last 30 days) - 18mo                                        0.0       1.0
i13            Average number of drinks (standard units) consumed per day (in past 30 days) - 18mo                  1.0     256.0
pcs3           SF36 Physical Composite Score - 18mo                                                                18.5      71.3
mcs3           SF36 Mental Composite Score - 18mo                                                                  13.4      66.1
cesd3          CESD total score - 18mo                                                                              0.0      60.0
indtot3        Inventory of Drug Use Consequences (InDue) total score - 18mo                                        0.0     121.0
drugrisk3      Risk Assessment Battery (RAB) drug risk score - 18mo                                                 0.0      22.0
sexrisk3       Risk Assessment Battery (RAB) sex risk score - 18mo                                                  0.0      13.0
pcrec3         Number of primary care visits in past 6 months - 18mo                                                0.0       2.0
e2b4           Number of times in past 6 months entered a detox program - 24mo                                      1.0      34.0
g1b4           Experienced serious thoughts of suicide (last 30 days) - 24mo                                        0.0       1.0
i14            Average number of drinks (standard units) consumed per day (in past 30 days) - 24mo                  1.0     113.0
pcs4           SF36 Physical Composite Score - 24mo                                                                15.4      69.7
mcs4           SF36 Mental Composite Score - 24mo                                                                   6.2      66.9
cesd4          CESD total score - 24mo                                                                              0.0      52.0
indtot4        Inventory of Drug Use Consequences (InDue) total score - 24mo                                        0.0     126.0
drugrisk4      Risk Assessment Battery (RAB) drug risk score - 24mo                                                 0.0      20.0
sexrisk4       Risk Assessment Battery (RAB) sex risk score - 24mo                                                  0.0      13.0
pcrec4         Number of primary care visits in past 6 months - 24mo                                                0.0       2.0






## Variables with Coded Levels and Their Labels

These next set of tables provide all the variables that have coded levels and labels (i.e. the "codebook" and values used for `PROC FORMAT` in `SAS` and treated as "factors" in `R`).


               Randomization Group
------------  --------------------
usual care                       0
HELP clinic                      1



|Racial Group of Respondent |
|:--------------------------|
|black                      |
|hispanic                   |
|other                      |
|white                      |



|Primary substance of abuse |
|:--------------------------|
|alcohol                    |
|cocaine                    |
|heroin                     |

          Gender of respondent
-------  ---------------------
Male                         0
Female                       1

       One or more nights on the street or shelter in past 6 months
----  -------------------------------------------------------------
no                                                                0
yes                                                               1

       Experienced serious thoughts of suicide (last 30 days) - Baseline
----  ------------------------------------------------------------------
no                                                                     0
yes                                                                    1

       Any BSAS substance abuse treatment at baseline
----  -----------------------------------------------
no                                                  0
yes                                                 1

       Use of alcohol post-detox
----  --------------------------
no                             0
yes                            1

       Use of any substance post-detox
----  --------------------------------
no                                   0
yes                                  1

       Post-detox linkage to primary care
----  -----------------------------------
no                                      0
yes                                     1

                                            CESD 1 - I was bothered by things that usually don't bother me
-----------------------------------------  ---------------------------------------------------------------
Not at all or less than 1 day                                                                            0
1-2 days                                                                                                 1
3-4 days                                                                                                 2
5-7 days or nearly every day for 2 weeks                                                                 3

                                            CESD 2 - I did not feel like eating; my appetite was poor
-----------------------------------------  ----------------------------------------------------------
Not at all or less than 1 day                                                                       0
1-2 days                                                                                            1
3-4 days                                                                                            2
5-7 days or nearly every day for 2 weeks                                                            3

                                            CESD 3 - I felt that I could not shake off the blues even with help from my family or friends
-----------------------------------------  ----------------------------------------------------------------------------------------------
Not at all or less than 1 day                                                                                                           0
1-2 days                                                                                                                                1
3-4 days                                                                                                                                2
5-7 days or nearly every day for 2 weeks                                                                                                3

                                            CESD 4 - I felt that I was just as good as other people
-----------------------------------------  --------------------------------------------------------
Not at all or less than 1 day                                                                     0
1-2 days                                                                                          1
3-4 days                                                                                          2
5-7 days or nearly every day for 2 weeks                                                          3

                                            CESD 5 - I had trouble keeping my mind on what I was doing
-----------------------------------------  -----------------------------------------------------------
Not at all or less than 1 day                                                                        0
1-2 days                                                                                             1
3-4 days                                                                                             2
5-7 days or nearly every day for 2 weeks                                                             3

                                            CESD 6 - I felt depressed
-----------------------------------------  --------------------------
Not at all or less than 1 day                                       0
1-2 days                                                            1
3-4 days                                                            2
5-7 days or nearly every day for 2 weeks                            3

                                            CESD 7 - I felt that everything I did was an effort
-----------------------------------------  ----------------------------------------------------
Not at all or less than 1 day                                                                 0
1-2 days                                                                                      1
3-4 days                                                                                      2
5-7 days or nearly every day for 2 weeks                                                      3

                                            CESD 8 - I felt hopeful about the future
-----------------------------------------  -----------------------------------------
Not at all or less than 1 day                                                      0
1-2 days                                                                           1
3-4 days                                                                           2
5-7 days or nearly every day for 2 weeks                                           3

                                            CESD 9 - I thought my life had been a failure
-----------------------------------------  ----------------------------------------------
Not at all or less than 1 day                                                           0
1-2 days                                                                                1
3-4 days                                                                                2
5-7 days or nearly every day for 2 weeks                                                3

       Experienced serious thoughts of suicide (last 30 days) - Baseline
----  ------------------------------------------------------------------
no                                                                     0
yes                                                                    1

                                            CESD 11 - My sleep was restless
-----------------------------------------  --------------------------------
Not at all or less than 1 day                                             0
1-2 days                                                                  1
3-4 days                                                                  2
5-7 days or nearly every day for 2 weeks                                  3

                                            CESD 12 - I was happy
-----------------------------------------  ----------------------
Not at all or less than 1 day                                   0
1-2 days                                                        1
3-4 days                                                        2
5-7 days or nearly every day for 2 weeks                        3

                                            CESD 13 - I talked less than usual
-----------------------------------------  -----------------------------------
Not at all or less than 1 day                                                0
1-2 days                                                                     1
3-4 days                                                                     2
5-7 days or nearly every day for 2 weeks                                     3

                                            CESD 14 - I felt lonely
-----------------------------------------  ------------------------
Not at all or less than 1 day                                     0
1-2 days                                                          1
3-4 days                                                          2
5-7 days or nearly every day for 2 weeks                          3

                                            CESD 15 - People were unfriendly
-----------------------------------------  ---------------------------------
Not at all or less than 1 day                                              0
1-2 days                                                                   1
3-4 days                                                                   2
5-7 days or nearly every day for 2 weeks                                   3

                                            CESD 16 - I enjoyed life
-----------------------------------------  -------------------------
Not at all or less than 1 day                                      0
1-2 days                                                           1
3-4 days                                                           2
5-7 days or nearly every day for 2 weeks                           3

                                            CESD 17 - I had crying spells
-----------------------------------------  ------------------------------
Not at all or less than 1 day                                           0
1-2 days                                                                1
3-4 days                                                                2
5-7 days or nearly every day for 2 weeks                                3

                                            CESD 18 - I felt sad
-----------------------------------------  ---------------------
Not at all or less than 1 day                                  0
1-2 days                                                       1
3-4 days                                                       2
5-7 days or nearly every day for 2 weeks                       3

                                            CESD 19 - I felt that people dislike me
-----------------------------------------  ----------------------------------------
Not at all or less than 1 day                                                     0
1-2 days                                                                          1
3-4 days                                                                          2
5-7 days or nearly every day for 2 weeks                                          3

                                            CESD 20 - I could not get going
-----------------------------------------  --------------------------------
Not at all or less than 1 day                                             0
1-2 days                                                                  1
3-4 days                                                                  2
5-7 days or nearly every day for 2 weeks                                  3

