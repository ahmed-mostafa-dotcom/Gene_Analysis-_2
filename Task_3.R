gene_names <- c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")
control <- c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)
treated <- c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8)
chromosome <- c("17", "17", "7", "8", "10", "12")
names(control) <- gene_names
names(treated) <- gene_names
fold_change <- treated / control
classification <- ifelse(fold_change > 1.2, "upregulated",
                         ifelse(fold_change < 0.8, "downregulated", "stable"))
classification_factor <- factor(classification, 
                                levels = c("upregulated", "downregulated", "stable"))
gene_info <- list(
  names = gene_names,
  stats = list(
    control = control,
    treated = treated
  ),
  source = "Example gene expression dataset"
)
gene_info$names
gene_info$date_analyzed <- "2026-10-02"
gene_df <- data.frame(
  gene_names = gene_names,
  control = control,
  treated = treated,
  chromosome = chromosome,
  fold_change = fold_change,
  classification = classification
)
gene_df[gene_df$chromosome == "17", ]
gene_dflog2_fc <- log2(gene_dffold_change)
gene_df <- gene_df[order(gene_df$fold_change, decreasing = TRUE), ]
write.csv(gene_df, "gene_df_sorted.csv", row.names = FALSE)
png("expression_plot.png", width = 800, height = 600)
plot(
  gene_df$control,
  gene_df$treated,
  xlab = "Control Expression",
  ylab = "Treated Expression",
  main = "Gene Expression: Control vs Treated",
  col = ifelse(
    gene_df$classification == "upregulated", "red",
    ifelse(
      gene_df$classification == "downregulated", "blue",
      "gray"
    )
  ),
  pch = 19
)
dev.off()
