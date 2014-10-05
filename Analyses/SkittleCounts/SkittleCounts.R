rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
#####################################
## @knitr LoadPackages
# require(xtable)
require(knitr)
require(plyr)
require(scales) #For formating values in graphs
require(RColorBrewer)
# require(reshape2) #For converting wide to long
require(ggplot2) #For graphing
# require(mgcv, quietly=TRUE) #For the Generalized Additive Model that smooths the longitudinal graphs.
#####################################
## @knitr DeclareGlobals
options(show.signif.stars=F) #Turn off the annotations on p-values

pathInput <- "./DataPhiFree/Raw/SkittleCounts.csv"

paletteDark <- c(
  Red = rgb(red=255, green=0, blue=0, maxColorValue=255), 
  Orange = rgb(red=255, green=153, blue=29, maxColorValue=255),
  Yellow = rgb(red=255, green=255, blue=0, maxColorValue=255),
  Green = "green", 
  Blue = rgb(red=0, green=71, blue=255, maxColorValue=255),
  Purple = rgb(red=239, green=63, blue=255, maxColorValue=255),
  Pink = rgb(red=255, green=20, blue=207, maxColorValue=255)
)
paletteLight <- adjustcolor(paletteDark, alpha.f=.3)

#####################################
## @knitr LoadData
# 'ds' stands for 'datasets'
ds <- read.csv(file=pathInput)

#####################################
## @knitr TweakData
ds$Color <- factor(ds$Color, levels=c("Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink"))

#####################################
## @knitr Marginals

ggplot(ds, aes(x=Color, y=Count, label=Count)) +
  geom_bar(stat="identity", color=paletteDark, fill=paletteLight) +
  geom_text(stat="identity") +
  theme_bw()

knitr::kable(ds)

