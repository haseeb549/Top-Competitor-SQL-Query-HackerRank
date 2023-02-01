# Top-Competitor-SQL-Query-HackerRank

Question 
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Answer 

select h.hacker_id, h.name 
from Submissions as s 
join Hackers as h 
on 
s.hacker_id = h.hacker_id 
join Challenges as c 
on
s.challenge_id = c.challenge_id
join Difficulty as d 
on
c.Difficulty_level = d.Difficulty_level
where s.score = d.score 
group by h.hacker_id, h.name 
having count(*) > 1
order by count(*) desc, h.hacker_id;


-- Second Solution

select hacker_id, name
from (
    select hacker_id,name, count(challenge_id) as CountC
     from(
         select t2.hacker_id, t2.name,t2.challenge_id
        from(
        select t1.hacker_id,t1.name,t1.score,t1.challenge_id,c.difficulty_level
            from(
                select h.hacker_id, h.name,s.challenge_id, s.score 
            from 
HACKERS h
JOIN SUBMISSIONS s
ON h.HACKER_ID = s.HACKER_ID) t1
JOIN CHALLENGES c
ON t1.CHALLENGE_ID = c.CHALLENGE_ID) t2
JOIN DIFFICULTY d
ON t2.DIFFICULTY_LEVEL = d.DIFFICULTY_LEVEL 
WHERE t2.SCORE = d.SCORE)
GROUP BY HACKER_ID, NAME
HAVING COUNTC > 1
ORDER BY COUNTC DESC, HACKER_ID ASC);
     