get_boot_results = function(bfa, .rotated, .target) {
  require(psych)
  rotated = Procrustes(bfa$loadings, .target)
  eigs = bfa$values[1:bfa$factors]
  corresp = diag(factor.congruence(.rotated, rotated$loadings))
  return(list(RMSEA=bfa$RMSEA, 
              TLI=bfa$TLI, 
              ChiSq=bfa$STATISTIC, 
              p = bfa$PVAL, 
              Loadings=rotated$loadings,
              correspondence = corresp, 
              eigenvalues = eigs))
}