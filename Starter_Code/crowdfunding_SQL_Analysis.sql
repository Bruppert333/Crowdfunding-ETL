-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select backers_count, cf_id, outcome
from campaign
where outcome = 'live'
order by backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select campaign.backers_count, campaign.cf_id, campaign.outcome, backers.first_name
from campaign
Inner join backers
	on campaign.cf_id = backers.cf_id
where outcome = 'live';

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select goal - pledged as remaining_goal_amount, campaign.outcome, backers.first_name, backers.last_name, backers.email
from campaign
--into email_contacts_remaining_goal_amount
Inner Join backers
	on campaign.cf_id = backers.cf_id
where outcome = 'live'
Order by remaining_goal_amount DESC;

select * from campaign;
-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


