##########
# Example for Practical 4
# Author: Stefano De Sabbata
# Date: 26 Septemnber 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

library(tidyverse)

# Load 2011 Output Area Classification data -------------------------------

# The line below will work for Practical 3, if the data is in your Project_03 folder
#leicester_2011OAC <- read_csv("2011_OAC_Raw_uVariables_Leicester.csv")

# The line below will work if you are working from the main repository
leicester_2011OAC <- read_csv(paste0(rprojroot::find_rstudio_root_file(), "/data/", "2011_OAC_Raw_uVariables_Leicester.csv"))


# Load Indexes of Multiple deprivation data -------------------------------

# The line below will work for Practical 3, if the data is in your Project_03 folder
#leicester_IMD2015 <- read_csv("IndexesMultipleDeprivation2015_Leicester.csv")

# The line below will work if you are working from the main repository
leicester_IMD2015 <- read_csv(paste0(rprojroot::find_rstudio_root_file(), "/data/", "IndexesMultipleDeprivation2015_Leicester.csv"))

# Change name of indexes and transform data to wide format
leicester_IMD2015_decile_wide <- leicester_IMD2015 %>%
  # Select only Socres
  filter(Measurement == "Decile") %>%
  # Trim names of IndicesOfDeprivation
  mutate(IndicesOfDeprivation = str_replace_all(IndicesOfDeprivation, "\\s", "")) %>%
  mutate(IndicesOfDeprivation = str_replace_all(IndicesOfDeprivation, "[:punct:]", "")) %>%
  mutate(IndicesOfDeprivation = str_replace_all(IndicesOfDeprivation, "\\(", "")) %>%
  mutate(IndicesOfDeprivation = str_replace_all(IndicesOfDeprivation, "\\)", "")) %>%
  # Spread
  spread(
    key = IndicesOfDeprivation,
    value = Value
  ) %>%
  # Drop columns
  select(-DateCode, -Measurement, -Units)


# Join --------------------------------------------------------------------

# Join data by LSOA code
leicester_2011OAC_IMD2015 <- leicester_2011OAC %>%
  left_join(leicester_IMD2015_decile_wide, by = c("LSOA11CD" = "FeatureCode"))


# Exercises solutions -----------------------------------------------------

leicester_2011OAC_supergroups <- leicester_2011OAC %>%
  pull(supgrpname) %>%
  unique()

# Solution to question 4.2.1

for (supergroup in leicester_2011OAC_supergroups) {
  leicester_2011OAC_IMD2015 %>%
    filter(supgrpname == supergroup) %>%
    group_by(IndexofMultipleDeprivationIMD) %>%
    summarise(
      eu_citizens_perc = (sum(u044 + u045) / sum(Total_Population)) * 100
    ) %>%
    print()
}

# Solution to question 4.2.2
for (supergroup in leicester_2011OAC_supergroups) {
  eu_citizens_perc <- leicester_2011OAC_IMD2015 %>%
    filter(supgrpname == supergroup) %>%
    summarise(
      eu_citizens_perc = (sum(u044 + u045) / sum(Total_Population)) * 100
    ) %>%
    pull(eu_citizens_perc)
  if (eu_citizens_perc > 5){
    print(supergroup)
  }
}

# Solution to question 4.2.3
median_index <- function(vector_of_numbers){
  vnum_min <- min(vector_of_numbers)
  vnum_max <- max(vector_of_numbers)
  vnum_median <- median(vector_of_numbers)
  m_index <- ((vnum_median - vnum_min) / (vnum_max - vnum_min)) - ((vnum_max - vnum_median) / (vnum_max - vnum_min))
  m_index
}

leicester_2011OAC_IMD2015 %>%
  pull(u044) %>%
  median_index