## Benchmarks

jayjay benchmark: 20161028_lgbm_jayjay_re_select_v2 (0.477 MCC CV, 0.49+ LB)

jayjay + Joost benchmark: 20161102_lgbm_jayjay_updated.R (0.477 MCC CV highly stable, 0.50+ LB)

---

## Negative values warning

If you wish to use my models without LightGBM, any negative value before training must be set to 0. And yes, it might conflict with actual 0s (but this does not seem to be an issue for training).

---

## Missing values warning

It is better to encode NAs as 0s currently. If you set them as -1 or any negative value, they will be set as 0 during training/predicting in LightGBM.

---

## Comparison

| Model | Public LB |
| --- | --- |
| 20161024_lgbm_jayjay.R | 0.489xx |
| 20161025_lgbm_jayjay_mike_255.R | 0.47165 |
| 20161028_lgbm_jayjay_re_select_v2.R | 0.489xx |
| 20161028_lgbm_jayjay_re_select_v4.R | 0.47951 |
| 20161101_lgbm_jayjay_stat_seed1.R | 0.49231 |
| 20161102_lgbm_jayjay_joost.R | 0.49543 |
| 20161102_lgbm_jayjay_updated.R | 0.50149 |
| 20161103_lgbm_joost_extreme.R | 0.02845 |
| 20161104_lgbm_detrend.R | 0.49945 |

---

Parameter search sweeping.

# Search 1: Depth

* Threads = 12
* Eta = 0.05
* Min_sample = 100
* Min_hess = 10
* Subsample = 1.0
* Colsample = 1.0

Leaves is variable.

| Try | Leaf | Iter + Std | AUC + Std | MCC + Std | MCC (1) | MCC (2) | Positives (3) |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| #1 | 511(9.00) | 096.2 + 21.2 | 0.9144 + 0.0032 | 0.4720 + 0.0056 | 0.4617 | 0.4690 | 3592 / 2249 / 2748 |
| #4 | 383(8.50) | 100.4 + 08.9 | 0.9170 + 0.0045 | 0.4725 + 0.0042 | 0.4658 | 0.4689 | 2369 / 2256 / 2308 |
| #6 | 319(8.25) | 107.2 + 09.5 | 0.9178 + 0.0048 | 0.4740 + 0.0019 | 0.4677 | 0.4703 | 3172 / 2244 / 2591 |
| #7 | 287(8.13) | 113.0 + 09.8 | 0.9177 + 0.0049 | 0.4756 + 0.0031 | 0.4688 | 0.4715 | 3064 / 2250 / 2572 |
| #2 | 255(8.00) | 110.4 + 10.2 | 0.9185 + 0.0040 | 0.4773 + 0.0047 | 0.4657 | 0.4741 | 2948 / 2248 / 2531 |
| #8 | 223(7.75) | 114.0 + 06.8 | 0.9180 + 0.0049 | 0.4767 + 0.0023 | 0.4679 | 0.4718 | 2679 / 2250 / 2441 |
| #5 | 191(7.50) | 118.8 + 07.9 | 0.9186 + 0.0042 | 0.4757 + 0.0055 | 0.4648 | 0.4722 | 2819 / 2251 / 2480 |
| #3 | 127(7.00) | 139.6 + 30.6 | 0.9189 + 0.0039 | 0.4751 + 0.0048 | 0.4669 | 0.4714 | 2853 / 2233 / 2489 |

* (1) = 5-fold threshold (CV)
* (2) = All (overfit)
* (3) = Overfit (2), CV (1), Average
