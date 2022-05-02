library(tidyverse)

my_flowers <- readr::read_tsv("data/flowers.txt")

# transmute ---------------------------------------------------------------




mutate(my_flowers, Sepal.Area = Sepal.Length * Sepal.Width) 
mutate(my_flowers, Sepal.Area = Sepal.Length * Sepal.Width, Species = NULL) 

transmute(my_flowers, Sepal.Area = Sepal.Length * Sepal.Width)



# geom_bar --------------------------------------------------------------------

my_flowers %>%
  mutate(Sepal.Area = Sepal.Width * Sepal.Length) %>% filter (Sepal.Area > 15) %>%
  group_by(Species) %>%
  summarise(my.sd = sd(Sepal.Area),
            Sepal.Area.Mean = mean(Sepal.Area)) %>% ggplot(aes(y = Sepal.Area.Mean, x = Species, fill = Species)) +
  geom_bar(stat="identity") + geom_errorbar(aes(ymin = Sepal.Area.Mean - my.sd,
                                                ymax = Sepal.Area.Mean + my.sd), width = .1) +
                                                theme_bw()
                                                

# more --------------------------------------------------------------------


