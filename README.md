# Case study for MEtabolic Regulation Rule INference (MERRIN) on Covert's model

This repository contains the data and notebook to reproduce the inference of
regulatory rules of the core regulated metabolic networks of [Covert *et al* (2001)](https://doi.org/10.1006/jtbi.2001.2405) from dynamic regulatory FBA (d-rFBA) simulations, performed with [FlexFlux](https://bmcsystbiol.biomedcentral.com/articles/10.1186/s12918-015-0238-z).

The notebooks can be visualized at https://nbviewer.org/github/bioasp/merrin-covert/tree/main/.

They can be executed interactively:
* online, using [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/bioasp/merrin-covert/HEAD)
* or on your computer, provided you have [Docker](https://docs.docker.com/get-docker/) and Python installed:
   1. download the notebooks and data from  https://github.com/bioasp/merrin-covert/archive/main.zip and extract the zip file
   2. execute the following commands, where ``merrin-covert`` is the folder in which you extracted the notebooks
  ```
  sudo pip install -U colomoto-docker # you may have to use pip3 instead of pip
  colomoto-docker --image bioasp/merrin -V v0 --bind merrin-covert
  ```

The ground-truth models are specified in the `data` repository, e.g., https://github.com/bioasp/merrin-covert/tree/main/data/covert:
* `metablic_network.xml` specifies the metabolic network in SBML format
* `regulatory_network.bnet` specifies the regulation rules, in [BoolNet format](http://colomoto.org/biolqm/doc/format-bnet.html)
* `interactions.txt` list the putative regulations (PKN - Prior Knowledge
  Network)
