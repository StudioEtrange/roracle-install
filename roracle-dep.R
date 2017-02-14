localRepo <- Sys.getenv("LOCAL_R_REPO")
.libPaths( c( localRepo) )

# Setting CRAN mirror
local({r <- getOption("repos")
       r["CRAN"] <- "http://cran.r-project.org"
       options(repos=r)
})

# ROracle dependencies
if( ! require("DBI",lib=localRepo) ) {
  install.packages("DBI",lib=localRepo)
}
