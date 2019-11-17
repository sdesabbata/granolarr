##########
# This code uses data from the Office for National Statistics
# to create a small dataset containing all the 167 variables
# used in the 2011 OAC (https://github.com/geogale/2011OAC)
# for the Output Area in Leicester City
# Author: Stefano De Sabbata
# Date: 17 July 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

# Download the file 2011 OAC Variables - 167 Initial.zip in the Storage folder
# http://tiny.cc/OAC-Var-167
# or see
# https://osf.io/hd6yf/

# Download the file OA11_LSOA11_MSOA11_LAD11_EW_LU.zip in the Storage folder
# https://borders.ukdataservice.ac.uk/lut_download_data.html?data=oa11_lsoa11_msoa11_lad11_ew_lu
# or see
# https://osf.io/hd6yf/

library(tidyverse)
library(sp)
library(rgdal)

# Create tmp dir if necessary
ifelse(!dir.exists(file.path(".", "tmp")), dir.create(file.path(".", "tmp")), FALSE)

# Extract data files
if (!dir.exists(file.path("./tmp", "2011 OAC 167 Variables"))) {
  unzip("Storage/2011 OAC Variables - 167 Initial.zip", exdir = "tmp")
}
if (!dir.exists(file.path("./tmp", "OA11_LSOA11_MSOA11_LAD11_EW_LU"))) {
  dir.create(file.path("./tmp", "OA11_LSOA11_MSOA11_LAD11_EW_LU"))
  unzip("Storage/OA11_LSOA11_MSOA11_LAD11_EW_LU.zip", exdir = "tmp/OA11_LSOA11_MSOA11_LAD11_EW_LU")
}
if (!dir.exists(file.path("./tmp", "E06000016"))) {
  unzip("Data/e06000016.zip", exdir = "tmp")
}


# Load data

vars_2011OAC <- read_csv("tmp/2011 OAC 167 Variables/2011_OAC_Raw_uVariables.csv")

areas_lookup <- read_csv("tmp/OA11_LSOA11_MSOA11_LAD11_EW_LU/OA11_LSOA11_MSOA11_LAD11_EW_LUv2.csv",
    col_types = cols(
      OA11CD = col_character(),
      LSOA11CD = col_character(),
      LSO11ANM = col_character(),
      MSOA11CD = col_character(),
      MSOA11NM = col_character(),
      LAD11CD = col_character(),
      LAD11NM = col_character(),
      LAD11NMW = col_character()
    )
  ) %>%
  select(-LAD11NMW)

leic_2011OAC <- readOGR("tmp/E06000016/E06000016_Leicester.shp")
leic_2011OAC_data <- leic_2011OAC@data

# Join data and write
leic_vars_2011OAC <-  areas_lookup %>%
  right_join(leic_2011OAC_data, by = c("OA11CD" = "oa_code")) %>%
  left_join(vars_2011OAC, by = c("OA11CD" = "OA")) %>%
  write_csv("Data/2011_OAC_Raw_uVariables_Leicester.csv")

# Copy variable names look-up file
file.copy("tmp/2011 OAC 167 Variables/2011_OAC_Raw_uVariables_Lookup.csv", "Data")

# Clean
unlink("tmp/2011 OAC 167 Variables", recursive = TRUE)
unlink("tmp/OA11_LSOA11_MSOA11_LAD11_EW_LU", recursive = TRUE)
unlink("tmp/E06000016", recursive = TRUE)
if(length(list.files(path = "./tmp", include.dirs = TRUE)) == 0){
  unlink("tmp", recursive = TRUE)
}