##########
# Make clean file in R
# Author: Stefano De Sabbata
# Date: 12 July 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

# Clean R Environment

rm(list = ls())

# Delete compiled files from R Markdown scripts

unlink("Lectures/html/*.html")
unlink("Lectures/Contents/_main.rds")
unlink("Lectures/Contents/_main.md")
unlink("Lectures/Contents/_main.html")
unlink("Lectures/Contents/_main.tex")
unlink("Lectures/Contents/_main.log")
unlink("Lectures/Contents/_main.pdf")
unlink("Lectures/bookdown", recursive = TRUE)
unlink("Lectures/Contents/_bookdown_files", recursive = TRUE)

unlink("Practicals/pdf/*.pdf")
unlink("Practicals/pdf/*.tex")
unlink("Practicals/Contents/_main.rds")
unlink("Practicals/Contents/_main.md")
unlink("Practicals/Contents/_main.html")
unlink("Practicals/Contents/_main.tex")
unlink("Practicals/Contents/_main.log")
unlink("Practicals/Contents/_main.pdf")
unlink("Practicals/bookdown", recursive = TRUE)
unlink("Practicals/Contents/_bookdown_files", recursive = TRUE)