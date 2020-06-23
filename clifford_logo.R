library(Rcpp)
library(ggplot2)
library(dplyr)
library(hexSticker)
# library(magick)
library(cowplot)
library(hexSticker)

opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

theme_icon <- function () {
  theme_void() + 
    theme(
      panel.background = element_rect(fill = "transparent", colour = NA), 
      plot.background = element_rect(fill = "transparent", colour = NA), 
      legend.background = element_rect(fill = "transparent", colour = NA), 
      legend.box.background = element_rect(fill = "transparent", colour = NA)
    )
}

cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')

a=-1.24458046630025
b=-1.25191834103316 
c=-1.81590817030519 
d=-1.90866735205054

df=createTrajectory(10, 0, 0, a, b, c, d)

# png("Clifford.png", units="px", width=1600, height=1600, res=300)
# ggplot(df, aes(x, y)) + geom_point(color="black", shape=46, alpha=.01) + opt
# dev.off()

p <- ggplot(df, aes(x, y)) + 
  geom_point(color="black", shape=46, alpha=.01) + 
  opt
p

p.sticker <- sticker(
  p, package=" ", p_size=3, 
  s_x=1, s_y=1, s_width=1.4, s_height=1.4,
  h_color = "black", h_fill = "white",
  filename="img/boxplot-icon-sticker.png"
)
