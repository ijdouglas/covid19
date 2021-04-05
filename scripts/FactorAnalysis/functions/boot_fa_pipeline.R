boot_fa_pipeline = function(B, DATA, NFACT, SOLVER, .ROTATED, .TARGET, CORES) {
  require(parallel)
  require(psych)
  require(GPArotation)
  mclapply(X=1:B, mc.cores=CORES, FUN=function(i) {
    refit = T; while(refit) {
      bcorr = bootstrap_data(DATA, i)
      fa_mod = try(fa(bcorr, nfactors=NFACT, n.obs=nrow(DATA), fm=SOLVER, rotate='none', covar=F), silent=T)
      refit = 'try-error' %in% class(fa_mod)
    }
    get_boot_results(fa_mod, .ROTATED, .TARGET)
  })
}