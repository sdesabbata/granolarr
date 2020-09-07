# Base image https://hub.docker.com/r/rocker/ml
FROM rocker/geospatial:4.0.2

# create an R user
ENV USER rstudio

## Copy requirements.R to container directory /tmp
COPY ./DockerConfig/Requirements.R /tmp/Requirements.R 
## install required libs on container
RUN Rscript /tmp/Requirements.R