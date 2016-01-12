shinyUI(fluidPage(
  
  titlePanel("title"),
  
  sidebarLayout(
    position = "right",
    sidebarPanel("sider"),
    mainPanel(
      h4("hello", align="center")
      
    )
  )
  
))