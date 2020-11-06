library(tidyverse)
library(ggplot2)

data <- read.table("exprData.txt",sep="\t",header=TRUE,row.names=1)
#mdata <- read.table("metadata.txt",sep="\t",header=TRUE,row.names=1)

tidyData <- data %>%
    rownames_to_column(var = "geneSymbol") %>%
    pivot_longer(
        cols = sample1_neuron:sample3_others,
        names_to = c("sample","celltype"),
        names_pattern = "(.*)_(.*)",
        values_to = "count"
    )
p <- ggplot(data = tidyData, aes(x = celltype, y = count, fill = sample)) + geom_violin()
p