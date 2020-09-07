REPO_DIR=${PWD}
docker run -d --rm -p 28787:8787 --name granolarr -v $REPO_DIR:/home/rstudio/granolarr sdesabbata/granolarr