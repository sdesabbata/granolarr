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
rmarkdown::render("101_L_Introduction.Rmd", quiet = TRUE)
rmarkdown::render("102_L_CoreConcepts.Rmd", quiet = TRUE)
rmarkdown::render("103_L_Tidyverse.Rmd", quiet = TRUE)
rmarkdown::render("111_L_DataTypes.Rmd", quiet = TRUE)
rmarkdown::render("112_L_ControlStructures.Rmd", quiet = TRUE)
rmarkdown::render("113_L_Functions.Rmd", quiet = TRUE)
rmarkdown::render("201_L_DataFrames.Rmd", quiet = TRUE)
rmarkdown::render("202_L_SelectionFiltering.Rmd", quiet = TRUE)
rmarkdown::render("203_L_DataManipulation.Rmd", quiet = TRUE)
rmarkdown::render("210_L_DataJoin.Rmd", quiet = TRUE)
rmarkdown::render("211_L_DataPivot.Rmd", quiet = TRUE)
rmarkdown::render("212_L_ReadWrite.Rmd", quiet = TRUE)
rmarkdown::render("221_L_Reproducibility.Rmd", quiet = TRUE)
rmarkdown::render("222_L_RMarkdown.Rmd", quiet = TRUE)
rmarkdown::render("223_L_Git.Rmd", quiet = TRUE)
rmarkdown::render("301_L_DataVisualisation.Rmd", quiet = TRUE)
rmarkdown::render("302_L_DescriptiveStats.Rmd", quiet = TRUE)
rmarkdown::render("303_L_ExploringAssumptions.Rmd", quiet = TRUE)
rmarkdown::render("311_L_ComparingMeans.Rmd", quiet = TRUE)
rmarkdown::render("312_L_Correlation.Rmd", quiet = TRUE)
rmarkdown::render("313_L_DataTransformations.Rmd", quiet = TRUE)
rmarkdown::render("321_L_Regression.Rmd", quiet = TRUE)
rmarkdown::render("322_L_RegressionAssessing.Rmd", quiet = TRUE)
rmarkdown::render("323_L_RegressionMultiple.Rmd", quiet = TRUE)
rmarkdown::render("401_L_MachineLearningIntro.Rmd", quiet = TRUE)
rmarkdown::render("402_L_ClusteringCentroid.Rmd", quiet = TRUE)
rmarkdown::render("403_L_ClusteringHierarchicalDensity.Rmd", quiet = TRUE)
rmarkdown::render("411_L_KNN.Rmd", quiet = TRUE)
rmarkdown::render("412_L_SupportVectorMachines.Rmd", quiet = TRUE)
rmarkdown::render("413_L_DeepLearning.Rmd", quiet = TRUE)

# Step 2-2: Compile the lecture files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Lectures"))
# Render the book
bookdown::render_book( "index.Rmd", "bookdown::gitbook", new_session = TRUE, output_dir = "bookdown", quiet = TRUE)
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())

# Step 3-1: Compile the practical files to pdf
rmarkdown::render("104_P_Introduction.Rmd", quiet = TRUE)
rmarkdown::render("114_P_RProgramming.Rmd", quiet = TRUE)
rmarkdown::render("204_P_SelectionManipulation.Rmd", quiet = TRUE)
rmarkdown::render("214_P_TableOperations.Rmd", quiet = TRUE)
rmarkdown::render("224_P_Reproducibility.Rmd", quiet = TRUE)
rmarkdown::render("304_P_Exploratory.Rmd", quiet = TRUE)
rmarkdown::render("314_P_ComparingData.Rmd", quiet = TRUE)
rmarkdown::render("324_P_Regression.Rmd", quiet = TRUE)
rmarkdown::render("404_P_GeoDemographicClassification.Rmd", quiet = TRUE)
rmarkdown::render("414_P_SupportVectorMachines.Rmd", quiet = TRUE)

# Step 3-1: Compile the practical files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/Practicals"))
# Render the book
bookdown::render_book("index.Rmd", "bookdown::gitbook", new_session = TRUE, output_dir = "bookdown", quiet = TRUE)
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())