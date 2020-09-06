##########
# Make clean file in R
# Author: Stefano De Sabbata
# Date: 12 July 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

# Clean R Environment

rm(list = ls())

# Delete compiled files from R Markdown scripts

unlink("src/lectures/contents/_main.rds")
unlink("src/lectures/contents/_main.md")
unlink("src/lectures/contents/_main.html")
unlink("src/lectures/contents/_main.tex")
unlink("src/lectures/contents/_main.log")
unlink("src/lectures/contents/_main.pdf")
unlink("src/lectures/contents/_bookdown_files", recursive = TRUE)
unlink("lectures/html/*.html")
unlink("lectures/bookdown", recursive = TRUE)

unlink("src/practicals/contents/_main.rds")
unlink("src/practicals/contents/_main.md")
unlink("src/practicals/contents/_main.html")
unlink("src/practicals/contents/_main.tex")
unlink("src/practicals/contents/_main.log")
unlink("src/practicals/contents/_main.pdf")
unlink("src/practicals/contents/_bookdown_files", recursive = TRUE)
unlink("practicals/pdf/*.pdf")
unlink("practicals/pdf/*.tex")
unlink("practicals/bookdown", recursive = TRUE)