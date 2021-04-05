get_target_mat = function(.mat) {
  signs = (.mat / abs(.mat))
  keys = apply(.mat, 1, function(x) ifelse(abs(x) == max(abs(x)), 1, 0))
  return(unclass(signs*t(keys)))
}