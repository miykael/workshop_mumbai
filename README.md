# Workshop Mumbai - 2018

This repository contains all documents for the workshop in Mumbai, July 2018.

Most of it's content is based on the [Nipype Tutorial](https://miykael.github.io/nipype_tutorial/) and the [Workshop in Cambridge](https://github.com/miykael/workshop_cambridge) in September 2018. But many things were shortend or left out, to fit everything in a 4h webinar.

The webinar will cover:

1. Conda and Docker
1. Dataset handling/BIDS introduction
1. Nilearn & Nibabel
1. Introduction to Nipype
1. Nipype basics
1. Nipype hands-on
1. Machine learning with nilearn, PyMPVA & keras

# How to access the workshop content

There are three ways on how you can access the content of this workshop.

## Via Jupyter nbviewer (non-interactive)

All the notebooks (but not the slides) can be looked at via [Jupyter nbviewer](https://nbviewer.jupyter.org/github/miykael/workshop_mumbai/blob/master/program.ipynb). Like this you can see everything but cannot really interact with the scripts or run the code.

## Via Docker (interactive)

We recommend that you install [Docker](https://www.docker.com/) on your machine to access the content of this workshop in an interactive way. To install Docker on your system, follow one of those links:

 - [Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntu/) or [Debian](https://docs.docker.com/engine/installation/linux/docker-ce/debian/)
 - [Windows 7/8/9/10](https://docs.docker.com/toolbox/toolbox_install_windows/) or [Windows 10Pro](https://docs.docker.com/docker-for-windows/install/)
 - [OS X (from El Capitan 10.11 on)](https://docs.docker.com/docker-for-mac/install/) or [OS X (before El Capitan 10.11)](https://docs.docker.com/toolbox/toolbox_install_mac/).

Once Docker is installed, open up the docker terminal and test if it works with the command:

    docker run hello-world

**Note:** Linux users might need to use ``sudo`` to run ``docker`` commands or follow [post-installation steps](https://docs.docker.com/engine/installation/linux/linux-postinstall/).

Once this worked proceed with the following steps to download and open the docker container for [this workshop](https://hub.docker.com/r/miykael/workshop_mumbai/):

1. Run the following command in a terminal: ```docker run -it --rm -p 8888:8888 miykael/workshop_mumbai```
1. Copy paste the link that looks like ```http://20f109eba8e4:8888/?token=0312c1ef3b61d7a44ff5346d3d150c23249a548850e13868``` into your webbrowser.
1. Replace the hash number ```20f109eba8e4``` after `http://` with `localhost` or your local IP (probably `192.168.99.100`) if you're on windows.
1. Once Jupyter Notebook is open, click on the `program.ipynb` notebook, and you're good to go.

**Note:** For more information about how to run docker on your machine, checkout [this section](https://miykael.github.io/nipype_tutorial/notebooks/introduction_docker.html#How-to-run-the-Docker-image) of the Nipype Tutorial.

## Via Conda and Neurodebian (interactive)

It's of course also possible to run the workshop content without a docker container, by installing all the required softwares on your systems yourself. To setup the right Python environment, you need to do the following steps:

1. Download and Install [Miniconda](https://conda.io/miniconda.html) on your system, if you don't have conda already on your system.
1. Download the `requirements.yml` file from [here](https://github.com/miykael/workshop_mumbai/blob/master/requirements.yml)
1. Open up a terminal and create a new conda environment with the provided `requirements.yml` file:
```conda env create --name workshop --file /path/to/requirements.yml```

Perfect! Now you should have all Python packages that are required for the workshop. As a next step, let's get all the necessary content on your system. For this, you need to:

- Download the [workshop content](https://github.com/miykael/workshop_mumbai) with [this link](https://github.com/miykael/workshop_mumbai/archive/master.zip). This file also contains the `dataset_ML.nii.gz` file that you need for the machine-learning notebook
- Download the [fMRI raw data](https://www.dropbox.com/sh/fvvium3z3l0wedo/AACkFi2mhWZkcqwmHjO8WwUra?dl=1).

Now, as a last step, if you want to run the Nipype notebooks, you also need to make sure that you have FSL on your system. For this, follow [this instructions](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation).

Once all this is setup, just go into the folder where you have the `prgoram.ipynb` notebook, run `jupyter notebook`. And you should be all set.

# Tutorial Dataset

The dataset that we use in this workshop differs from previous workshops and focuses on resting-state fMRI data. We will be using part of the dataset from [Zang et al.](https://doi.org/10.1007/s12021-013-9187-0). The original data can be download [here](http://fcon_1000.projects.nitrc.org/indi/retro/BeijingEOEC.html).

The docker container that we will be using for this workshop contains the raw data of the first three subjects, all that we need for the workshop. We've also added the pre-processed dataset and prepared the data of 48 subjects for the machine-learning part.
