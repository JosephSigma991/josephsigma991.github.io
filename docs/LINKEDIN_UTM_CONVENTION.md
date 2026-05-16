# LinkedIn UTM Naming Convention

Purpose:
Separate LinkedIn profile traffic, post traffic, first-comment traffic, and DM traffic in Umami.

## Fixed fields

utm_source:
- linkedin

utm_medium:
- profile
- social
- dm
- comment

utm_campaign:
- portfolio_profile
- postNN_topic_slug
- comment_YYYYMMDD_topic_slug
- dm_topic_slug

utm_content:
- profile_button
- first_comment
- post_body
- warm_reply
- author_reply
- connection_reply

## Rules

1. Permanent LinkedIn profile link must use:
   utm_source=linkedin
   utm_medium=profile
   utm_campaign=portfolio_profile
   utm_content=profile_button

2. A LinkedIn post first comment must use:
   utm_source=linkedin
   utm_medium=social
   utm_campaign=postNN_topic_slug
   utm_content=first_comment

3. A DM link must use:
   utm_source=linkedin
   utm_medium=dm
   utm_campaign=postNN_topic_slug OR dm_topic_slug
   utm_content=warm_reply

4. Do not reuse a post campaign name for the permanent profile link.

5. Do not judge performance until the campaign has enough visits to reduce noise.

Current active campaigns:
- post05_pre_meeting_readiness
- portfolio_profile
