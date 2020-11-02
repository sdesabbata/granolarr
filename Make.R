##########
# Make file in R
# Author: Stefano De Sabbata
# Date: 12 July 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

cat("\n\n>>> Making granolarr <<<\n\n")

# Un comment the install.packages command below
# if Tidyverse is not installed
#install.packages("tidyverse")

# Load necessary libraries
library(rmarkdown)
library(bookdown)
library(here)
library(stringr)

# Step 0:

# Setup
# Set home folder path as environment variable
# to be use as Knitr root dir

# Get Rscript arguments (if any)
args <- commandArgs(trailingOnly = TRUE)

# test if there is at least one argument: if not, return an error
if (length(args) == 0) {
  cat("No arguments, assuming current wd as GRANOLARR_HOME:\n")
  cat(here())
  cat("\n\n")
  Sys.setenv(GRANOLARR_HOME = here())
} else {
  args_granolarr_home <- ifelse(
    str_sub(args[1], -1, -1) == "/", 
    str_sub(args[1], 1, -2), 
    args[1]
    )
  cat("Setting GRANOLARR_HOME to:\n")
  cat(args_granolarr_home)
  cat("\n\n")
  Sys.setenv(GRANOLARR_HOME = args_granolarr_home)
}


# Make clean
source(paste0(Sys.getenv("GRANOLARR_HOME"), "/Make_Clean.R"))

# Step 1: execute the scripts
#

# Step 2-1: Compile the lecture files to html slides
cat("\n\n>>> Rendering 101_L_Introduction.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/101_L_Introduction.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 102_L_CoreConcepts.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/102_L_CoreConcepts.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 103_L_Tidyverse.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/103_L_Tidyverse.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 111_L_DataTypes.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/111_L_DataTypes.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 112_L_ControlStructures.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/112_L_ControlStructures.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 113_L_Functions.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/113_L_Functions.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 201_L_DataFrames.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/201_L_DataFrames.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 202_L_SelectionFiltering.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/202_L_SelectionFiltering.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 203_L_DataManipulation.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/203_L_DataManipulation.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 211_L_DataJoin.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/211_L_DataJoin.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 212_L_TidyData.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/212_L_TidyData.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 213_L_ReadWrite.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/213_L_ReadWrite.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 221_L_Reproducibility.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/221_L_Reproducibility.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 222_L_RMarkdown.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/222_L_RMarkdown.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 223_L_Git.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/223_L_Git.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 301_L_DataVisualisation.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/301_L_DataVisualisation.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 302_L_DescriptiveStats.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/302_L_DescriptiveStats.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 303_L_ExploringAssumptions.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/303_L_ExploringAssumptions.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 311_L_ComparingMeans.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/311_L_ComparingMeans.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 312_L_Correlation.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/312_L_Correlation.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 313_L_DataTransformations.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/313_L_DataTransformations.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 321_L_Regression.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/321_L_Regression.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 322_L_RegressionAssessing.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/322_L_RegressionAssessing.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 323_L_RegressionMultiple.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/323_L_RegressionMultiple.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 401_L_MachineLearningIntro.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/401_L_MachineLearningIntro.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 402_L_ClusteringCentroid.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/402_L_ClusteringCentroid.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 403_L_ClusteringHierarchicalDensity.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/403_L_ClusteringHierarchicalDensity.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 411_L_KNN.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/411_L_KNN.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 412_L_SupportVectorMachines.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/412_L_SupportVectorMachines.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))
cat("\n\n>>> Rendering 413_L_DeepLearning.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/413_L_DeepLearning.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/html"))

# Step 2-2: Compile the lecture files to bookdown

cat("\n\n>>> Rendering Lectures bookdown... <<<\n\n")

# Copy images directory to contents folder for local compile of bookdown
file.copy(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/images"), paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/"), recursive=TRUE)

# Change working directory to the Practicals folder
setwd(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents"))
# Render the book
bookdown::render_book( "index.Rmd", c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book"), new_session = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/bookdown"), quiet = TRUE)
# Change back working directory
setwd(Sys.getenv("GRANOLARR_HOME"))

# Delete temporary images directory
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/images"), recursive=TRUE)

# Rename pdf and epub files
file.rename(
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/bookdown/_main.pdf"), 
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/bookdown/granolarr_lecture_materials.pdf")
  )
file.rename(
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/bookdown/_main.epub"), 
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/lectures/bookdown/granolarr_lecture_materials.epub")
  )

# Cleaning compile files from lectures/contents
cat("\n\n>>> Cleaning Lectures folder tmp files... <<<\n\n")
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_main.rds"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_main.md"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_main.html"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_main.tex"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_main.log"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_main.pdf"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/*.pdf"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/*.png"))
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/lectures/contents/_bookdown_files"), recursive = TRUE)

cat("\n\n>>> done. <<<\n\n")

# Step 3-1: Compile the practical files to pdf
cat("\n\n>>> Rendering 104_P_Introduction.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/104_P_Introduction.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 114_P_RProgramming.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/114_P_RProgramming.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 204_P_SelectionManipulation.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/204_P_SelectionManipulation.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 214_P_TableOperations.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/214_P_TableOperations.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 224_P_Reproducibility.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/224_P_Reproducibility.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 304_P_Exploratory.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/304_P_Exploratory.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 314_P_ComparingData.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/314_P_ComparingData.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 324_P_Regression.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/324_P_Regression.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 404_P_Clustering.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/404_P_Clustering.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))
cat("\n\n>>> Rendering 414_P_SupportVectorMachines.Rmd <<<\n\n")
rmarkdown::render(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/414_P_SupportVectorMachines.Rmd"), quiet = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/pdf"))

# Step 3-2: Compile the practical files to bookdown

cat("\n\n>>> Rendering Practical sessions bookdown... <<<\n\n")

# Copy images directory to contents folder for local compile of bookdown
file.copy(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/images"), paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/contents/"), recursive=TRUE)

# Change working directory to the Practicals folder
setwd(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/contents"))
# Render the book
bookdown::render_book("index.Rmd", c("bookdown::gitbook", "bookdown::pdf_book", "bookdown::epub_book"), new_session = TRUE, output_dir = paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/bookdown"), quiet = TRUE)
# Change back working directory
setwd(Sys.getenv("GRANOLARR_HOME"))

# Delete temporary images directory
unlink(paste0(Sys.getenv("GRANOLARR_HOME"), "/src/practicals/contents/images"), recursive=TRUE)

# Rename pdf and epub files
file.rename(
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/bookdown/_main.pdf"), 
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/bookdown/granolarr_practical_session_materials.pdf")
  )
file.rename(
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/bookdown/_main.epub"), 
  paste0(Sys.getenv("GRANOLARR_HOME"), "/docs/practicals/bookdown/granolarr_practical_session_materials.epub")
  )

cat("\n\n>>> done. <<<\n\n")

cat("\n\n>>> granolarr is ready! <<<\n\n")