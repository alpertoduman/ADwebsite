
library(pwt10)

library(tidyverse)

pwt <- pwt10.01

names(pwt)

TFPpwt <- pwt %>% filter(isocode %in% c("TUR", "KOR", "USA", "POL", "DEU")) %>% 
          select(isocode, year, rgdpo, rtfpna, labsh, irr, ck)


ggplot(TFPpwt, aes(x = year, y = rtfpna, color = isocode)) +
  geom_line(size = 1) + 
  theme_bw() +
  labs(title = "TFP, base year = 2017",
       y = "TFP",
       x = "Year",
       caption = "Source = Penn World Tables, 10.01")

library("ggrepel") 

ggplot(TFPpwt, aes(x = year, y = rtfpna, color = isocode)) +
  geom_line(size = 1) + 
  theme_bw() +
   geom_label_repel(aes(label = isocode),
                 nudge_x = 1,
                 na.rm = TRUE) +
  theme(legend.position = "none")
