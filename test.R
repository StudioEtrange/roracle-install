localRepo <- Sys.getenv("LOCAL_R_REPO")

library(DBI,lib.loc=localRepo)
library(ROracle,lib.loc=localRepo)

Oracle()
#dbDriver("Oracle")