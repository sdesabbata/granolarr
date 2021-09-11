REPO_DIR=${PWD}
echo ""
echo "Bind mount granolarr folder from: $REPO_DIR"
docker run -ti --rm --name granolarr -u rstudio -v $REPO_DIR:/home/rstudio/granolarr sdesabbata/granolarr:v0.9 Rscript /home/rstudio/granolarr/Make.R /home/rstudio/granolarr
