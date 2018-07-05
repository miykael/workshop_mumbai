# Workshop Mumbai - 2018

This repository contains all documents for the workshop in Mumbai, July 2018.

Most of it's content is based on the [Nipype Tutorial](https://miykael.github.io/nipype_tutorial/) and the [Workshop in Cambridge](https://github.com/miykael/workshop_cambridge) in September 2018. But many things were left out, to fit everything in a 4h webinar.

The webinar will cover:

1. Bla
1. Bla
1. Bla
1. Bla
1. Bla
1. Bla
1. Bla
1. Bla
1. Bla

# Tutorial Dataset

The dataset that we use in this workshop differs from previous workshops and focuses on resting-state data. We will be using part of the dataset from [Zang et al.](https://doi.org/10.1007/s12021-013-9187-0). The original data can be download [here](http://fcon_1000.projects.nitrc.org/indi/retro/BeijingEOEC.html).

The docker container that we will be using for this workshop contains the raw data with a lower resolution, to keep data size to a minimum. We've also already pre-computed the normalization transformation matrix to speed up the pre-processing.

# How to access the workshop content

To run the workshop on your machine, you need to have [Docker](https://miykael.github.io/nipype_tutorial/notebooks/introduction_docker.html#Install-Docker) installed. Once this is done, proceed with the following steps:

1. Run the following command in a terminal: ```docker run -it --rm -p 8888:8888 miykael/workshop_mumbai```
1. Copy paste the link that looks like ```http://20f109eba8e4:8888/?token=0312c1ef3b61d7a44ff5346d3d150c23249a548850e13868``` into your webbrowser.
1. Replace the hash number ```20f109eba8e4``` after `http://` with `localhost` or your local IP (probably `192.168.100.0`) if you're on windows.
