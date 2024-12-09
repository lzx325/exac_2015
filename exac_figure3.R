options(stringsAsFactors=FALSE,timeout = max(300, getOption("timeout")))
library(plyr)
library(dplyr)
library(plotrix)

# Figure 3 - Constraint
pdf('figures/figure03-test.pdf', height=13, width=8.5)
layout(rbind(c(1, 2), c(3, 3), c(4, 5), c(6, 6)))
par(cex=1, oma=c(0, 0, 0, 0))
par(mar=c(5, 2, 2, 2))
if(FALSE){
    source('analysis/constraint/overall_constraint_figure_script.R')
    # 3A - Constraint
    cat("Making figure 3A\n")
    constraint_density_plot(save_plot=F)
    mtext('a', side=3, cex=2, adj = -0.05, line = 0.3)
}

if(FALSE){
    source('analysis/constraint/overall_constraint_figure_script.R')
    # 3B - Gene lists
    cat("Making figure 3B - gene lists\n")
    par(mar=c(2, 4, 2, 2))
    constraint_gene_lists(save_plot=F)
    mtext('b', side=3, cex=2, adj = -0.2, line = 0.3)
}

if(FALSE){
    # 3C - Expression
    cat("Making figure 3C - expression constraint\n")
    source('analysis/constraint/expression_constraint.R')
    gtex_data = prepare_gtex_data()
    par(mar=c(2, 4, 2, 0))
    plot_expression_constraint(gtex_data[[1]], gtex_data[[2]], save_plot=F)
    mtext('c', side=3, cex=2, adj = -0.08, line = 0.3)
}

if(FALSE){
    # 3D - eQTLs
    cat("Making figure 3D - eQTL constraint\n")
    source('analysis/constraint/eqtl_constraint.R')
    par(mar=c(5, 4, 2, 2))
    plot_eqtl_tissue(save_plot=F)
    mtext('d', side=3, cex=2, adj = -0.2, line = 0.3)
}

if(FALSE){
    # 3E - GWAS
    cat("Making figure 3E - GWAS constraint\n")
    source('analysis/constraint/GWAS_set_constraint.R')
    gwas_data = prepare_gwas_data()
    plot_gwas_figure(gwas_data, save_plot=F)
    mtext('e', side=3, cex=2, adj = -0.2, line = 0.3)
}
    
if(TRUE){
    # 3F - Categories with constraint - warning: this takes a long time
    cat("Making figure 3F - categories with constraint\n")
    source('analysis/summary/category_stats.R')
    source('analysis/constraint/category_stats_with_constraint.R')
    exac_mutation = get_exac_with_mutation_data()
    categories = category_comparison(exac_mutation)
    filtered_categories = filter_categories(categories, min_n_category = 10000)
    categories_detail = prepare_category_constraint_data(exac_mutation)
    par(mar=c(10, 4, 1, 2))
    plot_category_stats_constraint(filtered_categories, categories_detail, save_plot=F)
    mtext('f', side=3, cex=2, adj = -0.08, line = 0.3)
}

dev.off()

