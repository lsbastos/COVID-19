library(ggplot2)
library(xkcd)

p <-  ggplot(NULL, aes(c(0,8))) + 
  geom_area(stat = "function", 
            fun = dnorm, args = list(2, 0.5), 
            fill = "red", xlim = c(0, 8), alpha = 0.5) +
  geom_area(stat = "function", 
            fun = dnorm, args = list(4, 2),
            fill = "blue", xlim = c(0, 8), alpha = 0.5) +  
  scale_x_continuous(name = "Tempo", 
                     breaks = NULL,
                     #limits=c(0, 1)
                     ) +
  scale_y_continuous(name = "Número de casos", 
                     breaks = NULL
                     ) +
  geom_hline(yintercept = 0.2, size = 2, linetype = "dashed") 

p2 <- p + xkcdaxis(xrange = c(0,8), yrange = c(0,1) ) +
  annotate("text", x = 6, y = 0.25, label = "Capacidade do sistema de saúde", family="xkcd" ) +
  xkcdrect(NULL,  mapping = aes(xmin = 5, xmax = 5.5, ymin = 0.7, ymax = 0.75), 
           fill = "red", alpha = 0.5) +
  xkcdrect(NULL,  mapping = aes(xmin = 5, xmax = 5.5, ymin = 0.6, ymax = 0.65), 
           fill = "blue", alpha = 0.5) +
  annotate("text", x = 7, y = 0.725, 
           label = "Epidemia concentrada em um período", family="xkcd" ) +
  annotate("text", x = 6.75, y = 0.625, 
           label = "Epidemia espalhada no tempo", family="xkcd" ) +
  labs(caption="Fonte: Leo Bastos (PROCC/Fiocruz)")
  
p2

ggsave(filename = "flatten.png", plot = p2, device = "png")
