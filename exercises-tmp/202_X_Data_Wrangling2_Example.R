##########
# Example for Practical 3
# Author: Stefano De Sabbata
# Date: 24 Septemnber 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

library(tidyverse)

# Load 2011 Output Area Classification data -------------------------------

# The line above indicates a script section in RStudio
# and it can be generate in RStudio by selecting Code > Insert Section...
# from the main menu. Script sections can be seen and selected from the
# document outline (Code > Show Document Outline)

# The line below will work for Practical 3, if the data is in your Project_03 folder
#leicester_2011OAC <- read_csv("2011_OAC_Raw_uVariables_Leicester.csv")

# The line below will work if you are working from the main repository
leicester_2011OAC <- read_csv("Data/2011_OAC_Raw_uVariables_Leicester.csv")

# Print data info
leicester_2011OAC


# Load Indexes of Multiple deprivation data -------------------------------

# The line below will work for Practical 3, if the data is in your Project_03 folder
#leicester_IMD2015 <- read_csv("IndexesMultipleDeprivation2015_Leicester.csv")

# The line below will work if you are working from the main repository
leicester_IMD2015 <- read_csv("Data/IndexesMultipleDeprivation2015_Leicester.csv")


# Write_csv example -------------------------------------------------------

# The code below will work for Practical 3, if the data is in your Project_03 folder
read_csv("2011_OAC_Raw_uVariables_Leicester.csv") %>%
  select(OA11CD, supgrpcode, supgrpname) %>%
  filter(supgrpcode == 6) %>%
  write_csv("~/Leicester_Suburbanites.csv")

# The code below will work if you are working from the main repository
read_csv("Data/2011_OAC_Raw_uVariables_Leicester.csv") %>%
  select(OA11CD, supgrpcode, supgrpname) %>%
  filter(supgrpcode == 6) %>%
  write_csv("~/Leicester_Suburbanites.csv")


# Summarise ---------------------------------------------------------------

# Count OAs by supergroup
leicester_2011OAC %>%
  count(supgrpname)

# Group OAs by supergroup and calculate sums
leicester_2011OAC %>%
  group_by(supgrpname) %>%
  summarise(
    Total_Population = sum(Total_Population),
    Total_Households = sum(Total_Households)
  )


# Filter and select -------------------------------------------------------

# Show info of OA E01013649
leicester_IMD2015 %>%
  filter(FeatureCode == "E01013649") %>%
  select(FeatureCode, IndicesOfDeprivation, Measurement, Value)


# Mutate and spread -------------------------------------------------------

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

# Compare column names
colnames(leicester_IMD2015)
colnames(leicester_IMD2015_decile_wide)

# Original long IMD 2015 dataset
leicester_IMD2015 %>%
  filter(
    FeatureCode == "E01013649",
    IndicesOfDeprivation == "Index of Multiple Deprivation (IMD)",
    Measurement == "Decile"
  ) %>%
  select(FeatureCode, IndicesOfDeprivation, Measurement, Value)

# New wide IMD 2015 dataset
leicester_IMD2015_decile_wide %>%
  filter(FeatureCode == "E01013649") %>%
  select(FeatureCode, IndexofMultipleDeprivationIMD)


# Join --------------------------------------------------------------------

# Join data by LSOA code
leicester_2011OAC_IMD2015 <- leicester_2011OAC %>%
  left_join(leicester_IMD2015_decile_wide, by = c("LSOA11CD" = "FeatureCode"))

# Count OAs by supergroup and decile of IMD
leicester_2011OAC_IMD2015 %>%
  count(supgrpname, IndexofMultipleDeprivationIMD)

# Calculate the percentage of adults not in employment
leicester_2011OAC_IMD2015 %>%
  group_by(IndexofMultipleDeprivationIMD) %>%
  summarise(
    adults_not_empl_perc = (sum(u074 + u075) / sum(Total_Population)) * 100
  )


# Exercises solutions -----------------------------------------------------

# Solution to question 3.1.1
leicester_2011OAC_IMD2015 %>%
  filter( 
    supgrpname == "Cosmopolitans" |
    supgrpname == "Ethnicity Central" |
    supgrpname == "Multicultural Metropolitans"
  ) %>%
  group_by(IndexofMultipleDeprivationIMD) %>%
  summarise(
    eu_citizens_perc = (sum(u044 + u045) / sum(Total_Population)) * 100
  )

# Solution to question 3.1.2
leicester_2011OAC_IMD2015 %>%
  filter( 
    IndexofMultipleDeprivationIMD > 5
  ) %>%
  group_by(supgrpname) %>%
  summarise(
    eu_citizens_perc = (sum(u044 + u045) / sum(Total_Population)) * 100
  )

# Solution to question 3.1.3
leicester_2011OAC_IMD2015 %>%
  group_by(IndexofMultipleDeprivationIMD, supgrpname) %>%
  summarise(
    over_65_perc = (sum(u016 + u017 + u018 + u019) / sum(Total_Population)) * 100
  ) %>%
  arrange(desc(over_65_perc))

# Solution to question 3.2.1
leicester_2011OAC_IMD2015 %>%
  filter(supgrpname == "Suburbanites") %>%
  select(OA11CD, u016, u017, u018, u019) %>%
  gather(
    u016, u017, u018, u019,
    key = "oac_variable",
    value = "count"
  )

# Solution to question 3.2.2
leicester_2011OAC_IMD2015 %>%
  filter(supgrpname == "Suburbanites") %>%
  select(OA11CD, u016, u017, u018, u019, Total_Population) %>%
  mutate(u016_perc = (u016 / Total_Population) * 100) %>%
  mutate(u017_perc = (u017 / Total_Population) * 100) %>%
  mutate(u018_perc = (u018 / Total_Population) * 100) %>%
  mutate(u019_perc = (u019 / Total_Population) * 100) %>%
  select(OA11CD, u016_perc, u017_perc, u018_perc, u019_perc) %>%
  gather(
    u016_perc, u017_perc, u018_perc, u019_perc,
    key = "oac_variable",
    value = "count"
  )