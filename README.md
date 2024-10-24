# Library Management System (SQL)
This project is a SQL-based system designed to manage library operations efficiently, including  Books, Members, Loans, Authors, BookAuthors, and Fines calculations.

## Features
- Book loan management
- Member tracking
- Fine calculation based on return dates

  
1. Create Table:
o Write an SQL statement to create all tables with the specified columns.
2. Insert Records:
o Insert at least 10 records in all the tables.
3. Select Records:
o Write a query to select all books published before 2000 from the Books table.
4. Where Clause (AND/OR):
o Write a query to select all Loans where the LoanDate is in 2024 and the ReturnDate 
is NULL.
5. LIKE Operator:
o Write a query to select all Books where the Title contains 'Science'.
6. CASE Statement:
o Write a query to select Title and a new column Availability from the Books table. If a 
book has been loaned out (i.e., exists in Loans table with a NULL ReturnDate), set 
Availability to 'Checked Out', otherwise 'Available'.
7. Subquery:
o Write a query to find all Members who have borrowed more than 5 books. Use a 
subquery to find these MemberIDs.
8. Group By:
o Write a query to get the total number of books borrowed by each Member. Group 
the results by MemberID.
9. Having Clause:
o Write a query to get the total FineAmount collected for each LoanID, but only 
include loans where the total fine amount is greater than $10. Use the HAVING 
clause.
10. Limit:
o Write a query to select the top 5 most frequently borrowed books.
11. Inner Join:
o Write a query to join Loans with Books to get a list of all loans with Title, LoanDate, 
and ReturnDate.
12. Outer Join:
o Write a query to get a list of all Books and any associated loans. Include books that 
might not be currently borrowed.


## How to Use
1. Clone the repository.
2. Run the SQL script to set up the database.
3. Explore the queries for managing books, members, loans, and fines.

## Technologies
- SQL
- Database Design

