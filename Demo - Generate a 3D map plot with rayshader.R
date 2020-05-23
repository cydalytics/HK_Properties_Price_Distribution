##############################################################
# DEMO 1 - Generate a 2D map plot with ggplot2
##############################################################
library(xlsx)
district_name = read.xlsx2('District Name.xlsx',1)
population = read.xlsx2('Population Data.xlsx',1)
colnames(population) = c("Chi_name", "Population")

hkmap = readRDS("HKG_adm1.rds")

library(ggplot2)
# Preprocessing
map_data = data.frame(id=hkmap$ID_1, Code=hkmap$HASC_1, Eng_name=hkmap$NAME_1)
map_data$Code = gsub('HK.', '', as.character(map_data$Code))
map_data = merge(map_data, district_name, by = 'Eng_name')
hkmapdf = fortify(hkmap)
map_data = merge(hkmapdf, map_data, by="id")
map_data = merge(map_data, population, by = "Chi_name")
map_data$Population = as.numeric(map_data$Population)

# Map
map_bg = ggplot(map_data, aes(long, lat, group=group, fill = Population)) +
  geom_polygon() + # Shape
  scale_fill_gradient(limits=range(map_data$Population), 
                      low="#FFF3B0", high="#E09F3E") + # Population Density Color
  layer(geom="path", stat="identity", position="identity", 
       mapping=aes(x=long, y=lat, group=group, 
                   color=I('#FFFFFF'))) # Boarder Color
  
map_bg = map_bg + theme(legend.position = "none", 
                        axis.line=element_blank(), 
                        axis.text.x=element_blank(), axis.title.x=element_blank(),
                        axis.text.y=element_blank(), axis.title.y=element_blank(),
                        axis.ticks=element_blank(), 
                        panel.background = element_blank()) # Clean Everything
map_bg

# Save as PNG
xlim = ggplot_build(map_bg)$layout$panel_scales_x[[1]]$range$range
ylim = ggplot_build(map_bg)$layout$panel_scales_y[[1]]$range$range
ggsave('map_bg.png', width = diff(xlim)*40, height = diff(ylim)*40, units = "cm")


##############################################################
# DEMO 2 - Transform the 2D plot into 3D plot with rayshader
##############################################################

# Real Estate Dataset
estate_df = read.csv('real_estate_master_df.csv')
estate_df$apr_price = as.numeric(gsub('[^0-9]', '', estate_df$Price_Per_SqFeet_Apr2020))
estate_df$mar_price = as.numeric(gsub('[^0-9]', '', estate_df$Price_Per_SqFeet_Mar2020))

# Read Background Image
library(png)
hk_map_bg = readPNG('map_bg.png')

# 2D Plot
library(ggplot2)
library(grid)
estate_price = ggplot(estate_df) + 
  annotation_custom(rasterGrob(hk_map_bg, width=unit(1,"npc"), height=unit(1,"npc")), 
                    -Inf, Inf, -Inf, Inf) + # Background
  xlim(xlim[1],xlim[2]) + # x-axis Mapping
  ylim(ylim[1],ylim[2]) + # y-axis Mapping
  geom_point(aes(x=Longitude, y=Latitude, color=apr_price), size=2) + # Points
  scale_colour_gradient(name = '成交呎價(實)\n(HKD)', 
                        limits=range(estate_df$apr_price), 
                        low="#FCB9B2", high="#B23A48") + # Price Density Color
  theme(axis.line=element_blank(), 
        axis.text.x=element_blank(), axis.title.x=element_blank(),
        axis.text.y=element_blank(), axis.title.y=element_blank(),
        axis.ticks=element_blank(), 
        panel.background = element_blank()) # Clean Everything
estate_price
ggsave('estate_price.png', width = diff(xlim)*40, height = diff(ylim)*40, units = "cm")


# 3D Plot
library(rayshader)
plot_gg(estate_price, multicore = TRUE, width = diff(xlim)*10 ,height=diff(ylim)*10, fov = 70, scale = 300)

# Windows Size Setting
library(rgl)
par3d(windowRect = c(0, 0, diff(xlim) * 2500, diff(ylim) * 2500))

# Render Image
#render_camera(fov = 70, zoom = 0.2, theta = 30, phi = 20)
#render_depth(focus = 0.8, focallength = 600)

# Render Video
# Video 1
phivechalf = 30 + 60 * 1/(1 + exp(seq(-7, 20, length.out = 180)/2))
phivecfull = c(phivechalf, rev(phivechalf))
thetavec = 0 + 45 * sin(seq(0,359,length.out = 360) * pi/180)
zoomvec = 0.45 + 0.2 * 1/(1 + exp(seq(-5, 20, length.out = 180)))
zoomvecfull = c(zoomvec, rev(zoomvec))
render_movie(filename = 'output1', type = "custom", frames = 360,  phi = phivecfull, zoom = zoomvecfull, theta = thetavec)

# Video 2
transition_values <- function(from, to, steps = 10, one_way = FALSE, type = "cos") {
  if (!(type %in% c("cos", "lin"))){stop("type must be one of: 'cos', 'lin'")}
  range <- c(from, to)
  middle <- mean(range)
  half_width <- diff(range)/2
  if (type == "cos") {scaling <- cos(seq(0, 2*pi / ifelse(one_way, 2, 1), length.out = steps))}
  else if (type == "lin"){
    if (one_way) {xout <- seq(1, -1, length.out = steps)} 
    else {xout <- c(seq(1, -1, length.out = floor(steps/2)), seq(-1, 1, length.out = ceiling(steps/2)))}
    scaling <- approx(x = c(-1, 1), y = c(-1, 1), xout = xout)$y }
  middle - half_width * scaling
}
theta <- transition_values(from = 0, to = 360, steps = 360, one_way = TRUE, type = "lin")
phi <- transition_values(from = 10, to = 70, steps = 360, one_way = FALSE, type = "cos")
zoom <- transition_values(from = 0.4, to = 0.8, steps = 360, one_way = FALSE, type = "cos")
render_movie(filename = 'output2', type = "custom", frames = 360,  phi = phi, zoom = zoom, theta = theta)

# Close Windows
rgl.close()

