# SolMultinomClass: Daily Solar Irradiance Clustering

## `SolMultinomClass`

`SolMultinomClass` package is a new non-parametric Bayesian method for daily solar irradiance clustering. In many situations, there will be insufficient prior information and data to select the appropriate model complexity and size that best describe the data, which often lead to misleading results when one or more model assumptions are violated. `SolMultinomClass` allows a more flexible and Bayesian specification of distributions, so that the essential characteristics of the model are learned only from the data rather than specified in advance. The method is detailed in the attached paper below published in the Journal of [Solar Energy](https://www.sciencedirect.com/science/article/pii/S0038092X1830611X). 

`SolMultinomClass` package includes a set of functions allowing: 
- a clustering method namely Dirichlet multinomial mixture model. 
- a function to calculate of extraterrestrial solar radiation at a given site. 
- a function to calculate the day duration. 
- a function to encode the data as vectors of occupation numbers (as multinomial distribution samples)--- for more details, see the attached paper below. 
- a method for sizing stand-alone PV systems based on the loss of load probability concept.

## Software

You can install SolMultinomClass with the [remotes](https://install-github.me/r-lib/remotes) package:
```
remotes::install_github("frimane/SolMultinomClass")
```
or with [devtools](https://cran.r-project.org/web/packages/devtools/index.html):
```
devtools::install_github("frimane/SolMultinomClass")
```

## License

This package is free and open source software, licensed under GPLv2. Users are invited to adopt and adapt this work for whatever purpose they desire.

## Citation

If you want to use `SolMultinomClass` in a publication, please cite the original paper describing the model implemented in this software.
```
Frimane, Â., Aggour, M., Ouhammou, B., Bahmad, L., 2018. A dirichlet-multinomial mixture model-based approach for
daily solar radiation classification. Solar Energy 171, 31–39. URL: http://www.sciencedirect.com/science/article/pii/S0038092X1830611X, doi:https://doi.org/10.1016/j.solener.2018.06.059.
```
For bibTeX users:
```
@article{,
title = "A Dirichlet-multinomial mixture model-based approach for daily solar radiation classification ",
journal = "Solar Energy ",
volume = "171",
pages = "31-39",
year = "2018",
issn = "0038-092X",
doi = "https://doi.org/10.1016/j.solener.2018.06.059",
url = "https://www.sciencedirect.com/science/article/pii/S0038092X1830611X",
author = "Âzeddine Frimane and Mohammed Aggour and Badr Ouhammou and Lahoucine Bahmad"
}
```

## Contact
For any queries, please email Azeddine.frimane@yahoo.com or Azeddine.frimane@uit.ac.ma, I will be happy to help.
