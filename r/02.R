library(stringr)
#file <- "./input/02_sample.txt"
file <- "./input/02_input.txt"
#part 1
readLines(file) |>
  str_split(",") |>
  sapply(function(x) {
    (str_split(x, "-")) |>
      lapply(as.numeric)
  }) |>
  lapply(function(x) seq(x[1], x[2])) |>
  lapply(function(x) str_subset(x, "^(\\d+)(\\1)$")) |>
  unlist() |> 
  as.numeric() |> 
  sum()

#part 2
readLines(file) |>
  str_split(",") |>
  sapply(function(x) {
    (str_split(x, "-")) |>
      lapply(as.numeric)
  }) |>
  lapply(function(x) seq(x[1], x[2])) |>
  lapply(function(x) str_subset(x, "^(\\d+)(\\1)+$")) |>
  unlist() |> 
  as.numeric() |> 
  sum()





