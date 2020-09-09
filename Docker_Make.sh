REPO_DIR=${PWD}
echo ""
echo "Bind mount granolarr folder from: $REPO_DIR"
#docker run -d --rm -p 28787:8787 --name granolarr -v $REPO_DIR:/home/rstudio/granolarr sdesabbata/granolarr
docker run -ti --rm --name granolarr -u rstudio -v $REPO_DIR:/home/rstudio/granolarr sdesabbata/granolarr Rscript /home/rstudio/granolarr/Make.R /home/rstudio/granolarr
