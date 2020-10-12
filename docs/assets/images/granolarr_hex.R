# install.packages("hexSticker")

library(hexSticker)
library(showtext)

## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Orbitron", "orbitron")
## Automatically use showtext to render text for future devices
showtext_auto()


sticker(
  "docs/assets/images/granolarr_banner_001_center_cutout.png", 
  s_x = 1.6, 
  s_y = 1,
  package = "", 
  p_size = 9, 
  s_width = 1, 
  asp = 0.875,
  p_color = "#252525",
  h_fill = "#be4d23",
  h_color = "#252525",
  white_around_sticker = TRUE,
  url = "granolarr",
  u_color = "#252525",
  u_size = 4.5,
  u_family = "orbitron",
  u_x = 0.25,
  u_y = 0.65,
  u_angle = -31,
  filename = "docs/assets/images/granolarr_hex.png"
  )
