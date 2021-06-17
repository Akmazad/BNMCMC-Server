# BNMCMC-Server

## Introduction
Bayesian networks (BNs) are widely used to model biological networks from experimental data. Many software packages exist to infer BN structures, but the chance of getting trapped in local optima is a common challenge. Some recently developed Markov Chain Monte Carlo (MCMC) samplers called the Neighborhood sampler (NS) and Hit-and-Run (HAR) sampler, have shown great potential to substantially avoid this problem compared to the standard Metropolis-Hastings (MH) sampler.

We have developed a software called BNMCMC for inferring and visualizing BNs from given datasets. This software runs NS, HAR and MH samplers using a discrete Bayesian model. The main advantage of BNMCMC is that it exploits adaptive techniques to efficiently explore BN space and evaluate the posterior probability of candidate BNs to facilitate large-scale network inference.


## Download [Stand-alone Tool]
The standalone version (BN visualization missing) available for downloading at https://sourceforge.net/projects/bnmcmc/, where the user-guide and an example file are provided for a simulation.

## Citation
```
@article {Azad414953,
	author = {Azad, A. K. M. and Alyami, Salem A. and Keith, Jonathan M.},
	title = {BNMCMC: a software for inferring and visualizing Bayesian networks using MCMC methods},
	elocation-id = {414953},
	year = {2018},
	doi = {10.1101/414953},
	publisher = {Cold Spring Harbor Laboratory},
	URL = {https://www.biorxiv.org/content/early/2018/09/12/414953},
	eprint = {https://www.biorxiv.org/content/early/2018/09/12/414953.full.pdf},
	journal = {bioRxiv}
}
```
## Demo
[](img/bnmcmc1.png)
[](img/bnmcmc2.png)
[](img/bnmcmc3.png)
[](img/bnmcmc4.png)
