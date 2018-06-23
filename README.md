# SolMultinomClass

The SolMultinomClass package presents a new nonparametric Bayesian method for the classification of daily solar radiation distributions. Essentially, in many situations, there will be insufficient prior information and data to select the appropriate model complexity and size that best describe the data, which often lead to misleading results when one or more model assumptions are violated. In this case, nonparametric methods allow a more flexible and robust specification of distributions, so that their essential characteristics must be learned from the data rather than specified in advance. 
The SolMultinomClass package also includes a set of functions that allow: the calculation of extraterrestrial solar radiation on a given site, the calculation of the day duration, the coding of the data as vectors of occupation numbers (as samples of a multinomial distribution), function for generating synthetic daily clearness index with the same long-term statistical characteristics as the measured ones, and a method of sizing stand-alone PV systems based on the loss of load probability concept.


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

### Citation

If you use SolMultinomClass, please cite the original paper published in Solar Energy that describes this model and reports the results obtained with this software:

Âzeddine Frimane, Mohammed Aggour, Badr Ouhammou, Lahoucine Bahmad, A Dirichlet-multinomial mixture model-based approach for daily solar radiation classification, Solar Energy, Volume 171, 1 September 2018, Pages 31-39, ISSN 0038-092X, https://doi.org/10.1016/j.solener.2018.06.059.
(https://www.sciencedirect.com/science/article/pii/S0038092X1830611X)

For LaTeX users:

@article{,
title = "A Dirichlet-multinomial mixture model-based approach for daily solar radiation classification ",
journal = "Solar Energy ",
volume = "171",
pages = "31 - 39",
year = "2018",
issn = "0038-092X",
doi = "https://doi.org/10.1016/j.solener.2018.06.059",
url = "https://www.sciencedirect.com/science/article/pii/S0038092X1830611X",
author = "Âzeddine Frimane and Mohammed Aggour and Badr Ouhammou and Lahoucine Bahmad"
}
