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

## ----message = FALSE----------------------------------------------------------
library(dplyr)

color_index %>%
  group_by(roi_id) %>% # The column to get summaries by
  df_sem(color_index) # The column to summarize

## ----warning = TRUE-----------------------------------------------------------
df_sem(data = color_index, x = color_index)

## -----------------------------------------------------------------------------
color_index %>% 
  group_by(roi_id) %>% 
  t_test_one_sample(color_index)

## -----------------------------------------------------------------------------
color_index_one_sample_t_res <- color_index %>%
  group_by(roi_id) %>% 
  t_test_one_sample(color_index, p_adjust = c("bonferroni", "BH"))

knitr::kable(color_index_one_sample_t_res, digits = 3)

## -----------------------------------------------------------------------------
color_index %>% 
  t_test_one_sample(color_index)

## ---- message = FALSE---------------------------------------------------------
color_index_one_sample_t_with_sig <- color_index_one_sample_t_res %>% 
  mutate(sig_origin_p = p_range(p))

knitr::kable(color_index_one_sample_t_with_sig, digits = 3)

## -----------------------------------------------------------------------------
p_range(0.002)

## -----------------------------------------------------------------------------
head(color_index_two_sample)

## -----------------------------------------------------------------------------
color_index_two_sample %>% 
  group_by(roi_id) %>% 
  t_test_two_sample(color_effect, group, paired = TRUE)

