codingData <-
function(meas, Emeas, nBin) {
  
  re <- Emeas
  if(nrow(meas == 365)) re <- re[-60, ]
  rg <- meas
  k <- rg/re
  k[is.nan(k)] <- Inf
  for (i in 1:nrow(meas)) {  for (j in 1:ncol(meas)) {
    if(k[i,j] > 1 && k[i,j] != Inf) k[i,j] <- 1
    if(k[i,j] < 0) k[i,j] <- 0
  }}
  k[is.infinite(k)] <- 0
  fk <- t(apply(k, 1, function(x) (hist(x,breaks = seq(0, 1, by = 1/nBin), plot = FALSE)$count)))
  return(fk)
}
