/*How can you produce a list of facilities that charge a fee to members? */
SELECT *
FROM cd.facilities as cf
WHERE cf.membercost > 0;

/*How can you produce a list of facilities that charge a fee to members, 
and that fee is less than 1/50th of the monthly maintenance cost? 
Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.*/
SELECT *
FROM cd.facilities as cf
WHERE cf.membercost > 0 AND cf.membercost < cf.monthlymaintenance * 1/50;

/*How can you produce a list of all facilities with the word 'Tennis' in their name*/

SELECT *
FROM cd.facilities as cf
WHERE cf.name LIKE '%Tennis%';

/*How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.*/
SELECT *
FROM cd.facilities as cf
WHERE cf.facid IN (1, 5);

/*How can you produce a list of members who joined after the start of September 2012? 
Return the memid, surname, firstname, and joindate of the members in question.*/
SELECT cm.memid, cm.surname, cm.firstname, cm.joindate
FROM cd.members as cm
WHERE cm.joindate > '2012-09-01';

/*How can you produce an ordered list of the first 10 surnames in the members table? 
The list must not contain duplicates.*/
SELECT DISTINCT(cm.surname)
FROM cd.members as cm
ORDER BY cm.surname
LIMIT 10;

/*You'd like to get the signup date of your last member. How can you retrieve this information?*/
SELECT cm.joindate
FROM cd.members as cm
ORDER BY cm.joindate DESC
LIMIT 1;

/*Produce a count of the number of facilities that have a cost to guests of 10 or more.*/
SELECT COUNT(*)
FROM cd.facilities as cf
WHERE cf.guestcost >= 10;

/*Produce a list of the total number of slots booked per facility in the month of September 2012. 
Produce an output table consisting of facility id and slots, sorted by the number of slots.*/

SELECT facid, sum(slots) AS "Total_slots"
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots);

/*Produce a list of facilities with more than 1000 slots booked. 
Produce an output table consisting of facility id and total slots, sorted by facility id.*/
SELECT facid, SUM(slots) AS "Total_slots"
FROM cd.bookings
GROUP BY facid
Having SUM(slots) > 1000
ORDER BY facid;

/*How can you produce a list of the start times for bookings for tennis courts, 
for the date '2012-09-21'? Return a list of start time and facility name pairings, 
ordered by the time.*/
SELECT cb.starttime, cf.name
FROM cd.bookings AS cb
INNER JOIN cd.facilities AS cf
ON cb.facid = cf.facid
WHERE cf.name ILIKE 'Tennis Court%'
AND cb.starttime >= '2012-09-21' AND cb.starttime < '2012-9-22'
ORDER BY cb.starttime;

/*How can you produce a list of the start times for bookings by members named 'David Farrell'?*/
SELECT cb.starttime
FROM cd.bookings as cb
INNER JOIN cd.members as cm
ON cb.memid = cm.memid
WHERE cm.firstname = 'David'
AND cm.surname = 'Farrell'


