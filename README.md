# Handbook of Educational Measurement and Psychometrics (hemp) Using R Companion Package

## To download all the `R` code used in the Handbook of Educational Measurement and Psychometrics Using R, [please click here]( https://github.com/cddesja/hemp_code/archive/master.zip)

To visit the GitHub repository containing all the `R` code, [please click here](https://github.com/cddesja/hemp_code).

## The `hemp` package

The `hemp` package contains data sets and the functions used in Desjardins & Bulut (2018)'s book "Handbook of Educational Measurement and Psychometrics Using R" published by CRC Press.

Additionally, the functions in `hemp` can be used to conduct data analysis with classical test theory and generalizability theory.

To install the `hemp` package:

```{r}
install.packages("devtools")
devtools::install_github("cddesja/hemp")
```

If you're not using the most recent version of R, then the installation may not continue properly. If this is the case, you can use:

```{r}
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE) # in case your R version is older
devtools::install_github("cddesja/hemp")
```
If you get a message similar to the one below, please choose `3: None` by typing 3 in the R console and hitting enter.

```{r}
Downloading GitHub repo cddesja/hemp@master
These packages have more recent versions available.
It is recommended to update all of them.
Which would you like to update?

1: All                             
2: CRAN packages only              
3: None                            
4: Rcpp   (1.0.1 -> 1.0.4  ) [CRAN]
5: glue   (1.3.1 -> 1.3.2  ) [CRAN]
6: nloptr (1.2.1 -> 1.2.2.1) [CRAN]
7: plyr   (1.8.5 -> 1.8.6  ) [CRAN]

Enter one or more numbers, or an empty line to skip updates:
```
