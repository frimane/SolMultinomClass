dayLength <-
function(nj = 1, phi = 0) {
  
  delta <- 23.45*sin(0.01745329*(nj+284))
  dlen <- 2/15*(acos(-tan(delta*0.01745329)*tan(phi*0.01745329)))/0.01745329
  return(dlen)
}
