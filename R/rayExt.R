rayExt <-
function(phi = 0, lg = 0, tStep = 300) {
  
  calc <- function(t) {
    w <- 15*(t*tStep/3600 - 12)
    delta <- 23.45*sin(0.01745329*(nj+284))
    sinh <- cos(0.01745329*delta)*cos(0.01745329*phi)*cos(0.01745329*w) +
      sin(0.01745329*phi)*sin(0.01745329*delta)
    s <- 1367*(1-0.08547009*sin(0.01745329*delta))*sinh
    if (s < 0)    s <- 0
    return(s)
  }
  H <- matrix(NA, nrow = 366, ncol = floor(24*3600/tStep))
  for (nj in 1:366) {
    S <- sapply(c(1:floor(24*3600/tStep)), function(t) calc(t))
    H[nj, ] <- S
  }
  return(H)
}
