##########
# Make the full bookdown for the practicals
# Author: Stefano De Sabbata
# Date: 10 July 2019
##########

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Lectures"))

# Render the book
bookdown::render_book(
  "index.Rmd", 
  "bookdown::gitbook", 
  new_session = TRUE,
  output_dir = "bookdown")

# Change back working directory
setwd(rprojroot::find_rstudio_root_file())
