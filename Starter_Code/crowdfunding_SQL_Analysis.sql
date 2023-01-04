-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select backers_count, cf_id, outcome
from campaign
where outcome = 'live'
order by backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT(backers.cf_id), 
	backers.cf_id,
	campaign.outcome
FROM backers 
LEFT JOIN campaign 
ON (backers.cf_id = campaign.cf_id)
WHERE (campaign.outcome = 'live')
GROUP BY (backers.cf_id, campaign.outcome)
ORDER BY count DESC;
-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select contacts.first_name, contacts.last_name, contacts.email, (campaign.goal - campaign.pledged) as remaining_goal_amount
into email_contacts_remaining_goal_amount
from contacts 
Inner join campaign
on (contacts.contact_id = campaign.contact_id)
where (campaign.outcome = 'live')
order by remaining_goal_amount DESC;

-- Check the table
Select * from email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email,
	b.first_name,
	b.last_name,
	ca.cf_id,
	ca.company_name,
	ca.description,
	ca.end_date,
	(ca.goal - ca.pledged) AS left_of_goal
INTO email_backers_remaining_goal_amount
FROM backers as b
INNER JOIN campaign as ca
ON (b.cf_id = ca.cf_id)
WHERE (ca.outcome = 'live')
ORDER BY b.last_name ASC;

-- Check the table
SELECT * from email_backers_remaining_goal_amount;
