```{r cars}
data <- read.csv("censustract-00-10.csv")
data$PPCHG <- ifelse(data$PPCHG=="(X)",0,as.numeric(as.character(data$PPCHG)))
```

```{r pressure, echo=FALSE}
library(dplyr)

table_function <-function(data){
  table <- data%>%
    group_by(CBSA09,CBSA_T)%>%
    summarise(Total_Census_tracts = length(unique(TRACT10)),
              Total_Population_2000 = sum(POP00),Total_Population_2010 = sum(POP10),
              Average_Percentage_Change = round(mean(PPCHG),2))
}

table_function(data)

View(table)

```
