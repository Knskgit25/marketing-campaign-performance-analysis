# Marketing Campaign Performance Analysis

SQL-based analysis of digital marketing campaign performance across channels, funnel stages, and customer engagement — built to identify what actually drives conversion and where budget should shift.

## Overview

- **Dataset:** 8,000 customer touchpoints
- **Channels analyzed:** PPC, SEO, Social Media, Email, Referral (5)
- **Campaign types analyzed:** Awareness, Consideration, Conversion, Retention (4)
- **Tools:** MySQL (analysis), Google Sheets (visualization)

## Approach

1. Loaded and validated the raw dataset in MySQL Workbench.
2. Wrote SQL queries to compute conversion rate, cost-per-acquisition (CPA), and engagement-driven conversion lift.
3. Validated findings against the dataset's actual binary conversion outcome (not just the continuous conversion-probability feature) to ensure results were real, not artifacts of the wrong column.
4. Visualized results in Google Sheets and compiled key metrics into actionable recommendations.

## Key Findings

**1. Funnel stage is the strongest driver of conversion — not channel.**
Bottom-funnel (Conversion-type) campaigns converted at **93.36%**, compared to **85.56%** for top-funnel (Awareness) campaigns — an **~8-point gap**.

**2. Email engagement measurably lifts conversion.**
Customers with high email engagement (above-average opens) converted at **90.85%**, versus **84.50%** for low-engagement customers — a **~6-point lift**.

**3. Channel choice alone has limited standalone impact.**
Conversion rate and CPA were both tightly clustered across all 5 channels (≈1–2 point spread in conversion, ≈₹200 spread in CPA). Channel alone is not a strong predictor of performance — funnel stage and engagement matter more.

| Metric | Best performer | Weakest performer | Gap |
|---|---|---|---|
| Conversion by funnel stage | Conversion (93.36%) | Awareness (85.56%) | 7.8 pts |
| Conversion by engagement | High engagement (90.85%) | Low engagement (84.50%) | 6.35 pts |
| CPA by channel | PPC (₹5,612) | Email (₹5,809) | ₹197 |

## Recommendations

- **Shift budget toward bottom-funnel campaigns** (Conversion, Retention) where conversion is proven highest, rather than spreading spend evenly across the funnel.
- **Invest in email engagement nurturing** — opens and clicks correlate with meaningfully higher conversion, making engagement-building campaigns a worthwhile lever.
- **Don't over-index on channel reallocation.** Since channel-level differences are minor, budget decisions should be driven primarily by funnel stage and engagement signals, not platform choice alone.

## Repository Contents

- `queries.sql` — all SQL queries used for the analysis
- Chart screenshots — conversion by funnel stage, conversion by engagement, CPA by channel

## Skills Demonstrated

SQL (aggregation, CASE-based segmentation, grouped comparisons), data validation, metric design, business-focused insight generation.
