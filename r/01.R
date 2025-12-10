library(data.table)
#file = "./input/01_sample.txt"
file = "./input/01_input.txt"

# part 1
input <- readLines(file) |>
  stringr::str_replace_all(c("R" = "", L = "-")) |>
  as.integer()
sum(cumsum(c(50, input)) %% 100 == 0)

#part 2
pos <- 50
clicks <- 0

for (turn in input) {
  for (j in seq_len(abs(turn))) {
    pos <- pos + sign(turn)
    pos <- pos %% 100
    if (pos == 0) {
      clicks <- clicks + 1
    }
  }
}
clicks





