##########
# Make clean file in R
# Author: Stefano De Sabbata
# Date: 12 July 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

# Load necessary libraries
library(here)

# Clean R Environment

rm(list = ls())

# Delete compiled files from R Markdown scripts

unlink(here("src/lectures/contents/_main.rds"))
unlink(here("src/lectures/contents/_main.md"))
unlink(here("src/lectures/contents/_main.html"))
unlink(here("src/lectures/contents/_main.tex"))
unlink(here("src/lectures/contents/_main.log"))
unlink(here("src/lectures/contents/_main.pdf"))
unlink(here("src/lectures/contents/_bookdown_files"), recursive = TRUE)
#unlink(here("lectures/html/*.html"))
#unlink(here("lectures/bookdown"), recursive = TRUE)
unlink(here("docs/lectures/html/*.html"))
unlink(here("docs/lectures/bookdown"), recursive = TRUE)

unlink(here("src/practicals/contents/_main.rds"))
unlink(here("src/practicals/contents/_main.md"))
unlink(here("src/practicals/contents/_main.html"))
unlink(here("src/practicals/contents/_main.tex"))
unlink(here("src/practicals/contents/_main.log"))
unlink(here("src/practicals/contents/_main.pdf"))
unlink(here("src/practicals/contents/_bookdown_files"), recursive = TRUE)
#unlink(here("practicals/pdf/*.pdf"))
#unlink(here("practicals/pdf/*.tex"))
#unlink(here("practicals/bookdown"), recursive = TRUE)
unlink(here("docs/practicals/pdf/*.pdf"))
unlink(here("docs/practicals/pdf/*.tex"))
unlink(here("docs/practicals/bookdown"), recursive = TRUE)