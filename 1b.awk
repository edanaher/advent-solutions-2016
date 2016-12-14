
BEGIN {
  RS=" "
  d = 0
  x = 0
  y = 0
  visited[0][0] = 1
}

/L/ { d = d + 3 }
/R/ { d = d + 1 }
{ d = d % 4 }
{ dx = dy = 0 }
d == 0 { dx = -1 }
d == 1 { dy = -1 }
d == 2 { dx = 1 }
d == 3 { dy = 1 }

{
  match($0, /[0-9]+/, arr)
  for(i = 0; i < arr[0]; i++) {
    x += dx
    y += dy
    if(visited[x][y])
      nextfile
    visited[x][y] = 1
  }
}

END { print (x > 0 ? x : -x) + (y > 0 ? y : -y) }
