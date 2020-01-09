##########
# Make file in R
# Author: Stefano De Sabbata
# Date: 12 July 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

# Un comment the install.packages command below
# if Tidyverse is not installed
#install.packages("tidyverse")

# Load necessary libraries
#library(rmarkdown)

# Step 0: Make clean
source("Make_Clean.R")

# Step 1: execute the scripts
#

# Step 2-1: Compile the lecture files to html slides
rmarkdown::render("Lectures/101_L_Introduction.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/102_L_DataTypes.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/111_L_ControlStructuresFunctions.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/201_L_DataWrangling1.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/202_L_DataWrangling2.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/301_L_Reproducibility.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/501_L_Exploratory.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/502_L_Regression.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/601_L_Unsupervised.Rmd", quiet = TRUE)

# Step 2-2: Compile the lecture files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Lectures"))
# Render the book
bookdown::render_book( "index.Rmd", "bookdown::gitbook", new_session = TRUE, output_dir = "bookdown", quiet = TRUE)
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())

# Step 3-1: Compile the practical files to pdf
rmarkdown::render("Practicals/101_P_Introduction.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/102_P_DataTypes.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/111_P_ControlStructuresFunctions.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/201_P_DataWrangling1.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/202_P_DataWrangling2.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/301_P_Reproducibility.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/501_P_Exploratory.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/502_P_Regression.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/601_P_GeoDemographicClassification.Rmd", quiet = TRUE)

# Step 3-1: Compile the practical files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Practicals"))
# Render the book
bookdown::render_book("index.Rmd", "bookdown::gitbook", new_session = TRUE, output_dir = "bookdown", quiet = TRUE)
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())