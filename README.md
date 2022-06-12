# Module 7 Challenge - Pewlett-Hackard Employee Analysis

## Overview of Project

### Purpose

The purpose of this project is to build a database system to hold employee data for Pewlett-Hackard. Currently, Pewlet-Hackard stores their employee data in a series of CSV files. Our client, Bobby, has requested our help in building a database system that can be used to determine which employees will be retiring in the near future.

## Results

1. Our new database system provides a unified structure, pictured below, that connects all of Pewlett-Hackard's individual CSV files along common primary keys.

![EmployeeDB](https://user-images.githubusercontent.com/103288980/173212436-4c5b69f6-49b2-474b-9c74-9a1f5d881290.png)

2. Pewlett-Hackard's records contained multiple repeted entries for the same employees with different positions. These records were heldover as employees gained promotions throught the years. We have created a query that can be used to construct a list of retiring employees with only their current titles, seen below.
![unique_titles](https://user-images.githubusercontent.com/103288980/173212562-184c677a-3d4a-47ae-9b7a-c0c4abe31f60.PNG)

3. Bobby's manager requested a table containing the total number of retiring employees for different titles. We have created a query using the COUNT function that is capable of searching the unique_titles table from above and returning the total counts per title, seen below.
![retiring_titles](https://user-images.githubusercontent.com/103288980/173212787-768a3f69-089f-48c8-ad3c-aaffc522fb59.PNG)

4. Finally, we used multiple INNER JOINs to create a query that can be used to identify employees who are eligible to participate in a mentorship program. This table contains employees who were born between January 1, 1965 and December 31, 1965.
![mentorship_eligibilty](https://user-images.githubusercontent.com/103288980/173212784-e49539a9-9d3f-4bc2-9136-2ea3585416ea.PNG)

### Summary
