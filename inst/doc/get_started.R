## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup--------------------------------------------------------------------
library(roistats)

## ----example------------------------------------------------------------------
head(color_index)

## -----------------------------------------------------------------------------
str(color_index)

df_sem(color_index, color_index) # first arg refers the data.frame; second arg refers the coloumn

## -----------------------------------------------------------------------------
library(magrittr) # No need to import magrittr if you have imported tidyverse already
color_index_summary <- color_index %>%
  df_sem(color_index)

knitr::kable(color_index_summary, digits = 3)

## -----------------------------------------------------------------------------
t_test_one_sample(color_index, "color_index", mu = 0)

## -----------------------------------------------------------------------------
color_index_one_sample_t_res <- color_index %>%
  t_test_one_sample("color_index", mu = 0, p_adjust = c("bonferroni","fdr"))
knitr::kable(color_index_one_sample_t_res, digits = 3)

## ---- message = FALSE---------------------------------------------------------
library(dplyr)
color_index_one_sample_t_with_sig <- color_index_one_sample_t_res %>% 
  mutate(sig_origin_p = p_range(p))
knitr::kable(color_index_one_sample_t_with_sig, digits = 3)

## -----------------------------------------------------------------------------
p_range(0.002)

## -----------------------------------------------------------------------------
head(color_index_two_sample)
str(color_index_two_sample)

## -----------------------------------------------------------------------------
t_test_two_sample(color_index_two_sample, x = "color_effect", y = "group", paired = TRUE)

## -----------------------------------------------------------------------------
color_index_two_sample_t_res <- color_index_two_sample %>%
  t_test_two_sample(
    x = "color_effect", y = "group", paired = TRUE, p_adjust = c("bonferroni","fdr")
  )
knitr::kable(color_index_two_sample_t_res, digits = 3)

