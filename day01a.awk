
BEGIN {
  RS=" "
  d = 0
  x = 0
  y = 0
}

/L/ { d = d + 3 }
/R/ { d = d + 1 }
{ d = d % 4 }
{ n = substr($0, 2) }
d == 0 { x -= n }
d == 1 { y -= n }
d == 2 { x += n }
d == 3 { y += n }
END { print (x > 0 ? x : -x) + (y > 0 ? y : -y) }
