#input <- readLines("./input/04_sample.txt") 
input <- readLines("./input/04_input.txt") 
m <- str_split(input, "") |> unlist() |> matrix(ncol = max(length(input)))
m <- t(m)

#functie voor vinden van de 8 buren
buren <- function(mat, row, col) {
  # define the 3×3 block around the cell
  r_idx <- (row-1):(row+1)
  c_idx <- (col-1):(col+1)
  # clip indices to matrix bounds
  r_idx <- r_idx[r_idx >= 1 & r_idx <= nrow(mat)]
  c_idx <- c_idx[c_idx >= 1 & c_idx <= ncol(mat)]
  # extract block amnd return
  block <- mat[r_idx, c_idx, drop = FALSE]
  return(block)
}

#part 1
rolls <- 0
for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    if (m[i,j] == "@") {
      n <- buren(m,i,j)
      if (sum(n == "@") - 1 < 4) rolls = rolls + 1
    }
  }
}
rolls

#part 2
total_rolls_removed <- 0
new_m <- m
repeat {
  m <- new_m
  rolls_removed <- 0
  for (i in 1:nrow(m)) {
    for (j in 1:ncol(m)) {
      if (m[i,j] == "@") {
        n <- buren(m,i,j)
        if (sum(n == "@") - 1 < 4) {
          rolls_removed = rolls_removed + 1
          new_m[i,j] <- "X"
        }
      }
    }
  }
  total_rolls_removed <- total_rolls_removed + rolls_removed
  if (rolls_removed == 0) break
}
total_rolls_removed


