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
rmarkdown::render("src/lectures/101_L_Introduction.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/102_L_CoreConcepts.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/103_L_Tidyverse.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/111_L_DataTypes.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/112_L_ControlStructures.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/113_L_Functions.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/201_L_DataFrames.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/202_L_SelectionFiltering.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/203_L_DataManipulation.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/211_L_DataJoin.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/212_L_DataPivot.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/213_L_ReadWrite.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/221_L_Reproducibility.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/222_L_RMarkdown.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/223_L_Git.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/301_L_DataVisualisation.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/302_L_DescriptiveStats.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/303_L_ExploringAssumptions.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/311_L_ComparingMeans.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/312_L_Correlation.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/313_L_DataTransformations.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/321_L_Regression.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/322_L_RegressionAssessing.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/323_L_RegressionMultiple.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/401_L_MachineLearningIntro.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/402_L_ClusteringCentroid.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/403_L_ClusteringHierarchicalDensity.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/411_L_KNN.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/412_L_SupportVectorMachines.Rmd", quiet = TRUE, output_dir = "lectures/html")
rmarkdown::render("src/lectures/413_L_DeepLearning.Rmd", quiet = TRUE, output_dir = "lectures/html")

# Step 2-2: Compile the lecture files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/src/lectures/contents"))
# Render the book
bookdown::render_book( "index.Rmd", c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book"), new_session = TRUE, output_dir = "../../../lectures/bookdown", quiet = TRUE)
file.rename("../../../lectures/bookdown/_main.pdf", "../../../lectures/bookdown/granolarr_lecture_materials.pdf")
file.rename("../../../lectures/bookdown/_main.epub", "../../../lectures/bookdown/granolarr_lecture_materials.epub")
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())

# Step 3-1: Compile the practical files to pdf
rmarkdown::render("src/practicals/104_P_Introduction.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/114_P_RProgramming.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/204_P_SelectionManipulation.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/214_P_TableOperations.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/224_P_Reproducibility.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/304_P_Exploratory.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/314_P_ComparingData.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/324_P_Regression.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/404_P_GeoDemographicClassification.Rmd", quiet = TRUE, output_dir = "practicals/pdf")
rmarkdown::render("src/practicals/414_P_SupportVectorMachines.Rmd", quiet = TRUE, output_dir = "practicals/pdf")

# Step 3-2: Compile the practical files to bookdown

# Change working directory to the Practicals folder
setwd(paste0(rprojroot::find_rstudio_root_file(), "/src/practicals/contents"))
# Render the book
bookdown::render_book("index.Rmd", c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book"), new_session = TRUE, output_dir = "../../../practicals/bookdown", quiet = TRUE)
file.rename("../../../practicals/bookdown/_main.pdf", "../../../practicals/bookdown/granolarr_practical_session_materials.pdf")
file.rename("../../../practicals/bookdown/_main.epub", "../../../practicals/bookdown/granolarr_practical_session_materials.epub")
# Change back working directory
setwd(rprojroot::find_rstudio_root_file())
