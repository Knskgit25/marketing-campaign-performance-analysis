-- Dataset: Kaggle "Predict Conversion in Digital Marketing" (8,000 rows)
-- Table: marketing_campaign.digital_marketing_campaign_dataset
-- Conversion = binary outcome (1 = converted), so AVG(Conversion) = conversion rate

-- 0. Sanity checks
SELECT COUNT(*) AS total_rows,
       ROUND(AVG(Conversion)*100, 2) AS overall_conversion_pct
FROM marketing_campaign.digital_marketing_campaign_dataset;

-- 1. Conversion rate by funnel stage (CampaignType)
SELECT 
    CampaignType,
    ROUND(AVG(Conversion)*100, 2) AS conversion_rate_pct,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY CampaignType
ORDER BY conversion_rate_pct DESC;

-- 2. Conversion rate by channel
SELECT 
    CampaignChannel,
    ROUND(AVG(Conversion)*100, 2) AS conversion_rate_pct,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY CampaignChannel
ORDER BY conversion_rate_pct DESC;

-- 3. Email engagement vs conversion (high = 10+ opens)
SELECT 
    CASE 
        WHEN EmailOpens >= 10 THEN 'High Email Engagement'
        ELSE 'Low Email Engagement'
    END AS engagement_bucket,
    ROUND(AVG(Conversion)*100, 2) AS conversion_rate_pct,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY engagement_bucket;

-- 4. Cost per acquisition by channel (total ad spend / total conversions)
SELECT 
    CampaignChannel,
    ROUND(SUM(AdSpend) / SUM(Conversion), 2) AS cost_per_acquisition,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY CampaignChannel
ORDER BY cost_per_acquisition ASC;

-- 5. Where the engagement cutoff sits (for the README limitation)
SELECT ROUND(AVG(EmailOpens),2) AS avg_opens,
       MIN(EmailOpens) AS min_opens,
       MAX(EmailOpens) AS max_opens
FROM marketing_campaign.digital_marketing_campaign_dataset;
