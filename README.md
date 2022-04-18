
<!-- README.md is generated from README.Rmd. Please edit that file -->

# R package `PertGD`

[![](https://img.shields.io/badge/devel%20version-1.0.0-blue.svg)](https://github.com/HongfanChen/PertGD)
[![](https://img.shields.io/github/languages/code-size/HongfanChen/PertGD.svg)](https://github.com/HongfanChen/PertGD)
[![](http://cranlogs.r-pkg.org/badges/grand-total/PertGD?color=blue)](https://cran.r-project.org/package=PertGD)
[![](http://cranlogs.r-pkg.org/badges/last-month/PertGD?color=green)](https://cran.r-project.org/package=PertGD)
[![CRAN
checks](https://cranchecks.info/badges/summary/PertGD)](https://cran.r-project.org/web/checks/check_results_PertGD.html)

## Overview

We implement four gradient-based methods which can escape from saddle
point quickly. They are “Perturbed Gradient Descent”, “Perturbed
Accelerated Gradient Descent”, “Faster Perturbed Gradient Descent”, and
“Faster Perturbed Accelerated Gradient Descent”.

These methods are ensured to converge to
![\\epsilon](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;%5Cepsilon "\epsilon")-second
order stationary points in some steps related with problem’s dimension
and the accuracy we want, with probability
![1](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7D&space;%5Cbg_white&space;1 "1").

## Install from Github

If the devtools package is not yet installed, install it first:

``` r
install.packages('devtools')
```

Then run:

``` r
# install AEenrich from Github:
devtools::install_github('HongfanChen/PertGD') 
library(PertGD)
```

## Example usage

For documentation pages:

``` r
?train_2d
```

### Quick example:

``` r
## Objective function: --------------------------------------------------------
obj_f = function(x){
  y = 0.5 * x[1]^2 + 0.5 * sin(3 * x[1]) + x[2]^2
  return(y)
}

## Gradient function: ---------------------------------------------------------
gd = function(x){
  gd_vec = c(x[1] + 3 / 2 * cos(3 * x[1]), 2 * x[2])
  return(gd_vec)
}
## start from c(0.6806,0): ----------------------------------------------------
params1 = list(x = c(0.6806,0), eta = 0.1, theta = 0.5, epsilon = 1e-2,
               radius = 1e-3, v = c(0,0), gamma = 1e-2, s = 0.1, count = 0,
               t = 10, zeta = 0, z = c(1,1), x_0 = c(1,1), iter = 0, t_sub = 5,
               eta_sub = 0.05)
## get results: ---------------------------------------------------------------
res_gd = train_2d(vanilla_gd, params1, gd, obj_f, 20)
res_agd = train_2d(AGD, params1, gd, obj_f, 20)
res_pagd = train_2d(PAGD, params1, gd, obj_f, 20)
res_fpgd = train_2d(FPGD, params1, gd, obj_f, 20)
res_fpagd = train_2d(FPAGD, params1, gd, obj_f, 20)
```

### Current Suggested Citation

1.  Ge R, Huang F, Jin C, et al. Escaping from saddle points—online
    stochastic gradient for tensor decomposition\[C\]. Conference on
    learning theory. PMLR, 2015: 797-842.

2.  Lee J D, Simchowitz M, Jordan M I, et al. Gradient descent only
    converges to minimizers\[C\]. Conference on learning theory. PMLR,
    2016: 1246-1257.

3.  Jin C, Ge R, Netrapalli P, et al. How to escape saddle points
    efficiently\[C\]. International Conference on Machine Learning.
    PMLR, 2017: 1724-1732.

4.  Jin C, Netrapalli P, Jordan M I. Accelerated gradient descent
    escapes saddle points faster than gradient descent\[C\]. Conference
    On Learning Theory. PMLR, 2018: 1042-1085.

5.  Chenyi Zhang and Tongyang Li. Escape saddle points by a simple
    gradient-descent based algorithm. Advances in Neural Information
    Processing Systems. 2021.

6.  Jin C, Netrapalli P, Ge R, et al. On nonconvex optimization for
    machine learning: Gradients, stochasticity, and saddle points\[J\].
    Journal of the ACM (JACM), 2021, 68(2): 1-29.
