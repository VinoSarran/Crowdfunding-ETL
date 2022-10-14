
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select 
count(b.backer_id)as backer_counts_a ,b.cf_id
--into BackersCount
from backers b
join campaign c
on b.cf_id=c.cf_id
where c.outcome = 'live'
group by b.cf_id
order by count(b.backer_id) DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select 
count(b.backer_id)as backer_counts_b ,b.cf_id
--into BackersCount
from backers b
group by b.cf_id
order by count(b.backer_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select 
ct.first_name, ct.last_name,ct.email,
(cn.goal-cn.pledged) as "Remaining Goal Amount"
into email_contacts_remaining_goal_amount 
from contacts ct
join campaign cn
on ct.contact_id=cn.contact_id
where cn.outcome = 'live'
order by ("Remaining Goal Amount") DESC;

select * from email_contacts_remaining_goal_amount LIMIT 10;



-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
select 
ct.email,ct.first_name, ct.last_name,ct.cf_id,cn.company_name,cn.description,cn.end_date,
(cn.goal-cn.pledged) as "Left of Goal"
into email_backers_remaining_goal_amount  
from backers ct
join campaign cn
on ct.cf_id=cn.cf_id
where cn.outcome = 'live'
order by ct.last_name,ct.email ;

select * from email_backers_remaining_goal_amount LIMIT 10;


-- Check the table

