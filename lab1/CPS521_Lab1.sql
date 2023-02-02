/* Queries */
/* 1 */
SELECT ch_name, ch_id 
FROM channel
WHERE ch_category != 'Business';

/* 2 */
SELECT yt_user.user_name, channel.ch_name 
FROM channel, yt_user 
WHERE (channel.ch_category = 'Personal') AND (channel.user_id = yt_user.user_id);

/* 3 */
SELECT channel.user_id, yt_user.user_name, channel.ch_name
FROM channel, yt_user
WHERE (yt_user.user_name = 'Alice') AND (channel.user_id = yt_user.user_id) AND (channel.ch_category = 'Personal');

/* 4 */
SELECT channel.ch_name, COUNT(*) AS NUMBER_OF_SUBSCRIPTIONS
FROM subscription, channel WHERE channel.ch_id = subscription.ch_id
GROUP BY subscription.ch_id, channel.ch_name
ORDER BY channel.ch_name ASC;

/* 5 */
SELECT channel.ch_name, COUNT(subscription.ch_id) AS NUMBER_OF_SUBSCRIPTIONS
FROM channel
LEFT JOIN subscription ON channel.ch_id = subscription.ch_id
GROUP BY channel.ch_name
ORDER BY channel.ch_name ASC;

/* 6 */
SELECT channel.ch_name, yt_user.user_name, COUNT(subscription.ch_id) AS NUMBER_OF_SUBSCRIPTIONS
FROM channel
INNER JOIN yt_user ON channel.user_id = yt_user.user_id
LEFT JOIN subscription ON channel.ch_id = subscription.ch_id
GROUP BY channel.ch_name, yt_user.user_name
ORDER BY channel.ch_name ASC;

/* 7 */
SELECT COUNT(*) AS TOTAL_NUMBER_OF_SUBSCRIPTIONS
FROM subscription;