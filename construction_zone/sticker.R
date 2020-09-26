library(showtext)
## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Parisienne", "Parisienne")
## Automatically use showtext to render text for future devices
showtext_auto()

cave::createLogo("rawlogo3.png",
                 package = "Broca",
                 file = "logo.png",
                 p_y = 1.55,
                 p_family = "Parisienne",
                 p_size = 11,
                 s_width = .8,
                 s_height = .8,
                 s_x = 1,
                 s_y = .8,
                 h_fill = "#DCDCDC",
                 h_color = "#FFE4B5",
                 p_color = "#808080")

