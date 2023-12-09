library(dplyr)
library(plotly)

df <- data.frame(
  Country = c("EU","China","Canada","Mexico","UK","Japan","South Korea","Australia","Vietnam","Colombia","Brazil","India","All other countries"),
  value = c(590,530,300,400,170,160,110,80,60,40,55,50,255)
  )

df <- df |>
  mutate(df, share = value/sum(value)*100)

df$share <- format(round(df$share, digits = 1))

labels = df$Country
values = df$value
#title <- "Top U.S. general import sources in 2022"

fig <- plot_ly(
  type = "treemap",
  labels = ~labels,
  parents = NA,
  values = ~values,
  hovertemplate = paste("Country: ",labels,"<br>2022 U.S. general imports: $",values,"billion<br>Share of 2022 U.S. general imports",df$share,"%")
  #title = ~title
)

fig