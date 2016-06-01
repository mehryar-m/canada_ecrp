## Canada_ercp project      
## @Mehryar Maalem - 2016    
## this script is made to clean and structure data in the specifications that are
## required for statstical analysis

census_86 <- read.csv("~/OneDrive/Work/DG/data_files/1986.csv", head = TRUE)
census_91 <- read.csv("~/OneDrive/Work/DG/data_files/1991.csv", head = TRUE)
census_96 <- read.csv("~/OneDrive/Work/DG/data_files/1996.csv", head = TRUE)
census_01 <- read.csv("~/OneDrive/Work/DG/data_files/2001.csv", head = TRUE)
census_06 <- read.csv("~/OneDrive/Work/DG/data_files/2006.csv", head = TRUE)
census_11 <- read.csv("~/OneDrive/Work/DG/data_files/2011.csv", head = TRUE)

my.data <- rbind(eightsix, nineone, nonesix, zeroone, zerosix, eleven)

## Visible Minority
## definition: 
#     - members of visible minorities means persons,
#     other than aboriginal peoples, who are non-Caucasian in race or non-white in colour; 
#     (minorités visibles)
