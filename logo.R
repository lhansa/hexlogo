library(ggplot2)
library(magick)
library(cowplot)
library(hexSticker)

setwd("~/Projects/logo")

# Helper theme for ggplot icon
theme_icon <- function () {
  theme_void() + 
    theme(
      panel.background = element_rect(fill = "transparent", colour = NA), 
      plot.background = element_rect(fill = "transparent", colour = NA), 
      legend.background = element_rect(fill = "transparent", colour = NA), 
      legend.box.background = element_rect(fill = "transparent", colour = NA)
    )
}

P <- ggdraw() + 
  draw_image("~/Pictures/utils/logo (copy).png") + 
  theme_icon()


# ggsave(
#   filename = "~/Projects/logo/logo_sq.png", P, 
#   dpi=72, width = 1, height = 1, bg = "transparent"
# )

p.sticker <- sticker(
  P, 
  package = " ",
  # p_size=5, p_color = "#4f4f4f", # p_family = "Raleway",
  # p_x = 0.7, p_y = 0.1, 
  s_x=1, s_y=1, s_width=1.4, s_height=1.4,
  h_color = "#f47927", h_fill = "white",
  url = "R Hispano", 
  u_size = 3.5, u_color = "#4f4f4f", 
  u_x = 0.3, u_y = 0.52,  u_angle = 330, 
  filename="logo_hex.png"
)

p.sticker




