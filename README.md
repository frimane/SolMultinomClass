# SolMultinomClass

SolMultinomClass package presents a new nonparametric Bayesian method for classification of daily solar radiation.  In essence, for many situations, there will be insufficient prior information and data to justify such parametric assumptions. In this case, nonparametric methods allow a more flexible and robust specification of distributions, so their essential features to be learned from the data rather than specified in advance. SolMultinomClass package includes a set of functions allowing the calculating of the extraterrestrial solar radiation on a given site, calculating the day length, automatic classification of the daily clearness index coded as vectors of occupation numbers, a function for generating synthetic daily clearness index with the same long-term statistical characteristics as the measured ones, and a method of sizing a stand-alone PV system based on the classification results.


## Software

You can install SolMultinomClass with the [remotes](https://install-github.me/r-lib/remotes) package:

```
remotes::install_github("frimane/SolMultinomClass")
```

or with [devtools](https://cran.r-project.org/web/packages/devtools/index.html):

```
devtools::install_github("frimane/SolMultinomClass")
```

### License

This package is free and open source software, licensed under GPLv2.
