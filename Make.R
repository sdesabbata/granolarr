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
rmarkdown::render("Lectures/102_L_CoreConcepts.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/103_L_Tidyverse.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/111_L_DataTypes.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/112_L_ControlStructures.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/113_L_Functions.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/201_L_DataFrames.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/202_L_SelectionFiltering.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/203_L_DataManipulation.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/211_L_DataJoin.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/212_L_DataPivot.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/213_L_ReadWrite.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/221_L_Reproducibility.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/222_L_RMarkdown.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/223_L_Git.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/301_L_DataVisualisation.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/302_L_DescriptiveStats.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/303_L_ExploringAssumptions.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/311_L_ComparingMeans.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/312_L_Correlation.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/313_L_DataTransformations.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/321_L_Regression.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/322_L_RegressionAssessing.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/323_L_RegressionMultiple.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/401_L_MachineLearningIntro.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/402_L_ClusteringCentroid.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/403_L_ClusteringHierarchicalDensity.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/411_L_KNN.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/412_L_SupportVectorMachines.Rmd", quiet = TRUE)
rmarkdown::render("Lectures/413_L_DeepLearning.Rmd", quiet = TRUE)

# Step 2-2: Compile the lecture files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Lectures/Contents"))
# Render the book
bookdown::render_book( "index.Rmd", "bookdown::gitbook", new_session = TRUE, output_dir = "../bookdown", quiet = TRUE)
#bookdown::render_book( "index.Rmd", "bookdown::pdf_book", new_session = TRUE, output_dir = "../bookdown", quiet = TRUE)
#bookdown::render_book( "index.Rmd", "bookdown::epub_book", new_session = TRUE, output_dir = "../bookdown", quiet = TRUE)
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())

# Step 3-1: Compile the practical files to pdf
rmarkdown::render("Practicals/104_P_Introduction.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/114_P_RProgramming.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/204_P_SelectionManipulation.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/214_P_TableOperations.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/224_P_Reproducibility.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/304_P_Exploratory.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/314_P_ComparingData.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/324_P_Regression.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/404_P_GeoDemographicClassification.Rmd", quiet = TRUE)
rmarkdown::render("Practicals/414_P_SupportVectorMachines.Rmd", quiet = TRUE)

# Step 3-2: Compile the practical files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Practicals/Contents"))
# Render the book
bookdown::render_book("index.Rmd", "bookdown::gitbook", new_session = TRUE, output_dir = "../bookdown", quiet = TRUE)
#bookdown::render_book("index.Rmd", "bookdown::pdf_book", new_session = TRUE, output_dir = "../bookdown", quiet = TRUE)
#bookdown::render_book("index.Rmd", "bookdown::epub_book", new_session = TRUE, output_dir = "../bookdown", quiet = TRUE)
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())