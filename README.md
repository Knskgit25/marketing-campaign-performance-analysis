# Marketing Campaign Performance Analysis

SQL analysis of digital marketing campaign performance across channels, funnel stages, and email engagement, to find what drives conversion and where budget should shift.

## Dataset
- **Source:** [Predict Conversion in Digital Marketing Dataset](https://www.kaggle.com/datasets/rabieelkharoua/predict-conversion-in-digital-marketing-dataset) by Rabie El Kharoua, Kaggle. License: [CHECK ON DATASET PAGE].
- **Size:** 8,000 customer touchpoints, 20 columns (demographics, campaign details, engagement metrics, conversion outcome).
- **Note:** This is a public practice dataset, and its conversion rates (85-93%) are far higher than real campaigns. The relative comparisons are the focus, not the absolute rates.
- **Channels (5):** PPC, SEO, Social Media, Email, Referral
- **Campaign types (4):** Awareness, Consideration, Conversion, Retention

## Tools
MySQL Workbench (analysis), Google Sheets (charts)

## Approach
1. Loaded and validated the dataset in MySQL (row count, column types).
2. Computed conversion rate, cost per acquisition (CPA = total ad spend / total conversions), and conversion by email engagement.
3. Used the binary `Conversion` outcome rather than the continuous conversion-rate score, so results reflect what actually happened.
4. Checked the main gaps with two-proportion z-tests.
5. Charted results in Google Sheets and wrote recommendations.

## Key Findings

**1. Campaign type matters more than channel.** Conversion-type campaigns converted at 93.36% (n = 2,077) vs 85.56% for Awareness (n = 1,988), a 7.8-point gap (two-proportion z-test: z ≈ 8.1).

| Campaign type | n | Conversion rate |
|---|---|---|
| Conversion | 2,077 | 93.36% |
| Retention | 1,947 | 85.82% |
| Awareness | 1,988 | 85.56% |
| Consideration | 1,988 | 85.56% |

Only Conversion-type campaigns stand out. Retention converts at about the same rate as Awareness and Consideration.

**2. Higher email engagement goes with higher conversion.** Customers with above-average email opens converted at 90.85% (n = 3,967) vs 84.50% (n = 4,033) for the rest, a 6.35-point difference (z ≈ 8.6).

**3. Channel has little effect on its own.** Conversion rates across the five channels fell within 1.5 points of each other (86.83% to 88.31%), and the gap between the highest and lowest channel is not statistically significant (z ≈ 1.3). CPA ranged only from ₹5,612 to ₹5,809, a ₹197 spread.

| Channel | n | Conversion rate | CPA (₹) |
|---|---|---|---|
| Referral | 1,719 | 88.31% | 5,701 |
| PPC | 1,655 | 88.28% | 5,612 |
| SEO | 1,550 | 87.68% | 5,696 |
| Email | 1,557 | 87.03% | 5,809 |
| Social Media | 1,519 | 86.83% | 5,718 |

Email as a channel ranks fourth on conversion and highest on CPA. Its engagement effect (Finding 2) is about how customers behave, not a channel advantage.

## Recommendations
1. **Shift budget gradually toward Conversion-type campaigns**, and track total conversions, not only conversion rate, because awareness campaigns feed the audience that converts later.
2. **Test engagement-building email campaigns** to see whether raising opens raises conversion.
3. **Don't reallocate budget by channel alone.** Differences between channels are small.

## Limitations
- **Observational data, so correlation only.** Conversion-type campaigns likely target audiences that are already warm, so the 7.8-point gap partly reflects audience, not campaign quality.
- **Engagement may not cause conversion.** Customers who open emails may already be more likely to convert.
- **The "high engagement" cutoff is the dataset average,** which is arbitrary. Results should be re-checked with the median or quartiles.
- **Conversion rate is not ROI.** The analysis has no revenue per customer, only ad spend and conversions.
- **Synthetic practice data,** so absolute rates are unrealistic and findings should be validated on real campaign data.
- **Next step:** a controlled test (holdout group) before moving real budget.

## Repository Contents
- `queries.sql`: all SQL used
- `conversion_rate_pct.png`, `conversion_rate_pct vs CampaignType.png`, `cost_per_acquisition vs CampaignChannel.png`: charts

## Skills Demonstrated
SQL (aggregation, CASE segmentation, subqueries), data validation, metric definition (CPA, conversion rate), significance testing, business recommendations.
