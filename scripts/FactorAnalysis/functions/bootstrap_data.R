bootstrap_data = function(Data, .seed) {
  #set.seed(.seed)
  # Note, it's not a good idea to set the seed in here,
  # because in bootfa_pipeline(), this resampling occurs in a `while` loop
  # and therefore will reset to the same seed each iteration of the while loop.
  require(dplyr)
  resample=T
  while(resample) {
    booted = slice_sample(Data, prop = 1, replace = T)
    bcor = suppressWarnings(cor(booted, use='pairwise.complete'))
    resample = anyNA(bcor)
  }
  round(bcor, 5)
}