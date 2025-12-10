library(stringr)
#file <- "./input/03_sample.txt"
file <- "./input/03_input.txt"

#part 1
readLines(file) |> 
  lapply(str_split, "", simplify = TRUE) |>
  lapply(as.numeric) |>
  sapply(function(x) {
    digit1.pos <- which.max(x[1:(length(x) - 1)])
    digit1     <- x[1:(length(x) - 1)][digit1.pos]
    digit2.pos <- which.max(x[(digit1.pos + 1):length(x)])
    digit2     <- x[(digit1.pos + 1):length(x)][digit2.pos]
    paste0(digit1,digit2) |> as.numeric()
  }) |>
  sum()

#part 2
beste <- function(x) {
  final <- ""
  for (i in seq.int(11,0,-1)) {
    v <- x[1:(length(x) - i)]
    pos_best_digit <- which.max(v)
    best_digit <- v[pos_best_digit]
    x <- x[(pos_best_digit + 1):length(x)]
    final <- paste0(final, best_digit)
  }
  return(final)
}
options(digits = 20)
readLines(file) |> 
  lapply(str_split, "", simplify = TRUE) |>
  lapply(as.numeric) |>
  sapply(beste) |>
  as.numeric() |>
  sum()


