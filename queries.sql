-- Conversion rate by funnel stage (CampaignType)
SELECT 
    CampaignType,
    ROUND(AVG(Conversion)*100, 2) AS conversion_rate_pct,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY CampaignType
ORDER BY conversion_rate_pct DESC;

-- Conversion rate by channel
SELECT 
    CampaignChannel,
    ROUND(AVG(Conversion)*100, 2) AS conversion_rate_pct,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY CampaignChannel
ORDER BY conversion_rate_pct DESC;

-- Email engagement vs conversion
SELECT 
    CASE 
        WHEN EmailOpens >= 10 THEN 'High Email Engagement'
        ELSE 'Low Email Engagement'
    END AS engagement_bucket,
    ROUND(AVG(Conversion)*100, 2) AS conversion_rate_pct,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY engagement_bucket;

-- Cost per acquisition by channel
SELECT 
    CampaignChannel,
    ROUND(SUM(AdSpend) / SUM(Conversion), 2) AS cost_per_acquisition,
    COUNT(*) AS touchpoints
FROM marketing_campaign.digital_marketing_campaign_dataset
GROUP BY CampaignChannel
ORDER BY cost_per_acquisition ASC;