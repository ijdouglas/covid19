msg = "
#                                                       #
# | Exploratory and Bootstrapped Factor Analysis      | #
# | Ian J. Douglas - idouglas@utexas.edu - March 2021 | #
# | (written in R version 4.0.2)                      | # 
#                                                       # \n
-------------------------------------------------------
This script runs exploratory factor analysis on a dataset, and on a \
user-specified number of bootstrap resamples of that data. The reliability \
of loadings and factors are computed and returned, as well as the entire EFA \
from the full data (an R object of class: 'psych' 'fa'). 
------------------------------------------------------- \n
Usage: this script takes arguments/options in the format `-name value` \n
Possible argument names and descriptions: \n
-e, or
  -efa : full sample exploratory factor analysis for which to assess reliability\n
-d, or 
  -dataPath : the path pointing to the dataset \n
-r, or 
  -rLibrary : the path pointing to the folder where R packages are installed \n
-l, or
  -loadingsRotation : name of function (from some R package) with which to rotate facotrs\n 
-n, or 
  -nBootstraps : the number of bootstrap resamples to draw (defaults to 1000) \n
-o, or 
  -outputFolder : the folder where the results of the analysis will be written \n
-c, or 
  -cores : the number of CPUs to use in parallel (defaults to all available) \n
-help : print this message and exit script (the -help option can stand alone). \n
--------
Examples:
`Rscript BootstrapFA.R -d /path/to/data/data.csv -nBootstraps 1000`
`Rscript BootstrapFA.R -help` \n
--------
Details:
The path to the data must point to a .csv or .rds file (for now other file types \
simply won't read-in). If no rLibrary is supplied, the default for `library()` \
is invoked. nBootstraps defaults to 1000. outputFolder defaults to the \
working directory of the Rsession (usually where the script is run). \
The maximum number of cores is detected using parallel::detectCores(), \
and all are used to parallelize bootstrapping by default."

args = commandArgs(trailingOnly = T)
if (any(grepl('-help', args))) {
  cat(msg)
  quit(save = "no", status = 0)
}
# Parse command line arguments
keys = args[seq(1, length(args), by = 2)]
values = args[seq(2, length(args), by = 2)]
# Check of formatting for arguments and values
# check1 = "Options must be set using argument and value pairs in the format \
# `-ARGUMENT VALUE` (except the -help option. Set the -help option for examples)"
# stopifnot(check1 = length(keys) == length(values))
# # Check that no arguments are duplicated
# check2 = "Arguments cannot be duplicated"
# stopifnot(check2 = length(unique(keys)) == length(keys))
# Use options/arguments to set variables
args = setNames(object = as.list(values), nm = sub("^-", "", keys))
# This will match either the abbreviated or full option/argument names:
Dat = args$d # dataPath
LIB = args$r # rLibrary
N = args$n # nBootstraps
EFA = args$e # full sample, psych fa object, already fit, for comparison
# process loadings rotation function argument:
library(GPArotation, lib.loc = LIB)
loading_rotation = try(match.fun(args$l)) #get(args$l, envir=as.environment('package:GPArotation')))
if ('try-error' %in% class(loading_rotation))
{
  loading_rotation = GPArotation::Varimax;
  rot_nm = 'Varimax'
} else rot_nm = args$l
# end processing loadings rotation func.
if (is.null(rot_nm)) {rot_nm = 'Varimax'; loading_rotation = match.fun('Varimax')}
Outpath = args$o # outputFolder
#Outpath = file.path(Outpath, paste0("BFA-RESULTS_", Sys.Date(), ".rds"))
Cores = args$c # cores
# Print out some startup messages
cat("Exploratory and Bootstrapped Factor Analysis \n 
    --------------------------------------------- \n
    Script start time: ", Sys.time(), "\n",
    "Outputs will be written to: ", Outpath, "\n",
    "Run `Rscript BootstrapFA.R -help` for more information \n\n")

# Load required packages from the specified library or default location
# Path to the library with the pkgs:
null_if_not = function(x) {ifelse(is.na(x), NULL, x)}
library(crayon, lib.loc = null_if_not(LIB))
library(cli, lib.loc = null_if_not(LIB))
library(psych, lib.loc = null_if_not(LIB))
library(dplyr, lib.loc = null_if_not(LIB))
library(readr, lib.loc = null_if_not(LIB))
library(magrittr, lib.loc = null_if_not(LIB))
library(GPArotation, lib.loc = null_if_not(LIB))
library(parallel, lib.loc = null_if_not(LIB))
library(abind, lib.loc = null_if_not(LIB))
library(stringr, lib.loc = null_if_not(LIB))
library(purrr, lib.loc = null_if_not(LIB))
# Processing the path to the data:
# Allow it to figure out if its a csv or rds (other file types not supported)
ext = tail(unlist(str_split(Dat,"\\.")), 1)
if (grepl("csv", Dat, ignore.case = T)) {
  beh <- read_csv(Dat)
}
if (grepl("rds", Dat, ignore.case = T)) {
  beh <- readRDS(Dat)
}
# Read in the efa, if exists
if (!is.null(EFA)) 
{
  EFA = readRDS(EFA)
}

# Begin factor analysis pipeline if full sample solution is NOT supplied.
# A. Quick data cleaning
X <- beh %>%
  select(ID = `Child Participant ID`, contains('choice=')) %>%
  rename_at(vars(-ID), ~sub("\\..+choice=", '_', .) %>% 
              sub('\\)', '', x = .) %>% 
              gsub(' ', '_', x = .))
factorAnalysisData <- X %>%
  select(starts_with(match = c('ID', '2_', '4_', '16_', '26_', '27_'))) %>%
  # Drop the "Other" variable and 'None' (which could be implied by other responses)
  select(-contains(match = c('Other', 'None')))

# B. For binary variables, pearson correlation is equivalent to phi
factorAnalysisPhi <- round(cor(factorAnalysisData %>% select(-ID),
                               use = 'pairwise.complete'), 4)
cat('Check that EFA is not NULL passed')
if (is.null(EFA)) 
{
  # C. Full sample parallel analysis
  para <- factorAnalysisPhi %>% 
    fa.parallel(x = ., fa='pc', # number of orthogonal components based on eigenvalues
                n.obs = nrow(factorAnalysisData), 
                fm = "pa", plot = F)

  # D. Fit the full sample FA with the suggested number of factors from step C
  FA_full_sample <- fa(
    r = factorAnalysisPhi, 
    nfactors = para$ncomp, 
    n.obs = nrow(factorAnalysisData), 
    rotate = 'none', # Note, using varimax rotation
    covar = FALSE, 
    fm = 'pa' # principal axes
  )
} else FA_full_sample <- EFA
# E. Extract the loadings, compute the target matrix
#thresh = .3 # threshold after which loadings are 'salient' (find citation)
.L. = as.matrix(loading_rotation(FA_full_sample$loadings)$loadings) # the loadings
signs = (.L. / abs(.L.)) # the sign (pos/neg) of each loading
#TargetMat  = replace(as.matrix(signs), abs(.L.) <= thresh, 0)
TargetMat = signs*t(apply(.L., 1, function(x) ifelse(abs(x) == max(abs(x)), 1, 0))) 

# Now that we have the info, make the filename
fprefix = paste0(rot_nm, "-", FA_full_sample$Call$fm, "-", FA_full_sample$factors, "-") 
Outpath = file.path(Outpath, paste0(fprefix,'BFA-RESULTS_',Sys.Date(), '.rds')) 
cat('\nWriting Results to: ', Outpath, '\n')

# F. Resample the data (w/ replacement) and rerun the EFA.
#### Extract the eigen values of the bootstrapped EFA, the congruence for each 
#### full sample factor, and the loadings for each variable, on each bootstrapped
#### factor (after rotating the bootstrapped loadings to the target matrix)
cat('Starting bootstraps at '); as.character(Sys.time()); cat('\n')
boot_fa_results = mclapply(
  X=1:ifelse(is.null(N), 1000, N), 
  mc.cores = ifelse(is.null(Cores), detectCores(), Cores),
  FUN= function(i) {
    set.seed(i)
    # Resample the data with replacement
    # If the bootstrap sample results in variables with zero SD, resample again
    # If all good, compute the correlation matrix and proceed
    resample = TRUE
    while(resample) {
      booted <- slice_sample(factorAnalysisData, prop = 1, replace = T)
      bcor = round(suppressWarnings(cor(booted %>% select(-ID), use = 'pairwise.complete')), 4)
      if (!anyNA(bcor)) {
        bfa = try(fa(
          r = bcor, 
          nfactors = FA_full_sample$factors, #same as full sample solution
          n.obs = nrow(bcor), 
          rotate = 'none', # doesn't really matter, will rotate to target later
          covar = FALSE, 
          fm = FA_full_sample$Call$fm # same as full sample solution
        ), silent = T)
        cat(bfa$RMSEA, '     ', FA_full_sample$Call$fm,  '   ') 
        bfa.class.test <- 'try-error' %in% class(bfa)
      }
      test1 = ifelse(exists("bfa"), bfa.class.test, TRUE)
      test2 = anyNA(bcor)
      resample = test1 | test2
    }
    # FA fit, proceed to extract stats
    #rotated = target.rot(bfa$loadings, keys = TargetMat)
    rotated = Procrustes(bfa$loadings, TargetMat)
    eigenvalues = bfa$values[1:bfa$factors]
    correspondence = diag(factor.congruence(.L., rotated$loadings))
    return(list(bfa= bfa, 
                RMSEA = bfa$RMSEA[1], TLI = bfa$TLI, ChiSq = bfa$STATISTIC, p = bfa$PVAL, 
                Loadings = rotated$loadings,
                correspondence = correspondence,
                eigenvalues = eigenvalues))
})
quit()
cat('\nFinished bootstraps at: \n'); as.character(Sys.time()); cat('\n')
# Use the results of the bootstrap FA to create summaries
# Loadings
loadings_means = apply(
  abind(lapply(boot_fa_results, function(L) L$Loadings), along = 3),
  MARGIN = 1:2, FUN = mean
)
loadings_SDs = apply(
  abind(lapply(boot_fa_results, function(L) L$Loadings), along = 3),
  MARGIN = 1:2, FUN = sd
)

#Eigenvalues
eig_means = colMeans(purrr::map(boot_fa_results, pluck, "eigenvalues") %>% 
                       reduce(c) %>% 
                       matrix(ncol = 10, byrow = T))
eig_SDs = purrr::map(boot_fa_results, pluck, "eigenvalues") %>% 
  reduce(c) %>% 
  matrix(ncol = 10, byrow = T) %>%
  apply(., 2, sd)
EIGENVALUES = list('Mean' = eig_means, 'SD' = eig_SDs)

# Correspondences
corr_means = colMeans(purrr::map(boot_fa_results, pluck, "correspondence") %>% 
                        reduce(c) %>% 
                        matrix(ncol = 10, byrow = T))
corr_SDs = purrr::map(boot_fa_results, pluck, "correspondence") %>% 
  reduce(c) %>% 
  matrix(ncol = 10, byrow = T) %>%
  apply(., 2, sd)
CORRESPONDENCE = list('Mean' = corr_means, 'SD' = corr_SDs)

# Bootstrap distributions of fit statistics and other scalar values
vals = c('RMSEA','TLI','ChiSq', 'p')
vals = sapply(vals, function(x) {sapply(boot_fa_results, pluck, x)})
# Compile outputs and save to folder
out = list(
  'EFA' = FA_full_sample,
  'BFA' = list('ALL_MODELS' = sapply(boot_fa_results, pluck, 'bfa'),
               'Stats' = vals,
               'Loadings' = list('Means' = loadings_means,
                                 'SD' = loadings_SDs),
               'Eigenvalues' = EIGENVALUES,
               'Correspondence' = CORRESPONDENCE)
  
)

saveRDS(out, Outpath)
