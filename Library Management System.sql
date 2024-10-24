create database Library;
use Library;
# 1) creating Tables 
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    PublicationYear YEAR,
    Genre VARCHAR(100)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    MembershipDate DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255),
    BirthYear YEAR
);

CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    LoanID INT,
    FineAmount DECIMAL(10, 2),	
    PaidDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

# 2) Inserting Records 
INSERT INTO Books (BookID, Title, Author, PublicationYear, Genre) VALUES
(1, 'Introduction to Science', 'John Doe', 1995, 'Science'),
(2, 'Advanced Mathematics', 'Jane Smith', 2005, 'Mathematics'),
(3, 'Physics for Beginners', 'Albert Newton', 1998, 'Science'),
(4, 'The Art of Computer Programming', 'Donald Knuth', 1973, 'Computer Science'),
(5, 'Modern Chemistry', 'Mary Johnson', 2010, 'Science'),
(6, 'Data Structures and Algorithms', 'Robert Martin', 2018, 'Computer Science'),
(7, 'Biology 101', 'Alice Brown', 1985, 'Biology'),
(8, 'Environmental Science', 'William Green', 1992, 'Science'),
(9, 'Digital Marketing Essentials', 'Philip Kotler', 2021, 'Business'),
(10, 'History of the World', 'H.G. Wells', 1920, 'History');
select * from Books;

INSERT INTO Members (MemberID, FirstName, LastName, Email, MembershipDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-11-30'),
(3, 'Albert', 'Newton', 'albert.newton@example.com', '2021-06-20'),
(4, 'Mary', 'Johnson', 'mary.johnson@example.com', '2024-02-10'),
(5, 'Robert', 'Martin', 'robert.martin@example.com', '2024-05-25'),
(6, 'Alice', 'Brown', 'alice.brown@example.com', '2020-03-12'),
(7, 'William', 'Green', 'william.green@example.com', '2019-08-05'),
(8, 'Philip', 'Kotler', 'philip.kotler@example.com', '2024-07-01'),
(9, 'H.G.', 'Wells', 'hg.wells@example.com', '2018-04-18'),
(10, 'Emily', 'Clark', 'emily.clark@example.com', '2024-09-01');
select * from Members;

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 1, 1, '2024-01-10', NULL),
(2, 3, 2, '2023-12-05', '2024-01-02'),
(3, 5, 3, '2024-03-15', NULL),
(4, 2, 4, '2024-07-10', '2024-08-01'),
(5, 7, 5, '2023-06-15', '2023-07-10'),
(6, 6, 6, '2024-01-30', NULL),
(7, 4, 7, '2024-04-10', '2024-05-01'),
(8, 8, 8, '2024-05-20', '2024-06-10'),
(9, 9, 9, '2024-06-25', NULL),
(10, 10, 10, '2024-08-05', '2024-09-01');
select * from Loans;

INSERT INTO Authors (AuthorID, AuthorName, BirthYear) VALUES
(1, 'John Doe', 1965),
(2, 'Jane Smith', 1970),
(3, 'Albert Newton', 1950),
(4, 'Donald Knuth', 1938),
(5, 'Mary Johnson', 1982),
(6, 'Robert Martin', 1941),
(7, 'Alice Brown', 1968),
(8, 'William Green', 1975),
(9, 'Philip Kotler', 1931),
(10, 'H.G. Wells', 1866);
select * from Authors;

INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
select * from BookAuthors;

INSERT INTO Fines (FineID, LoanID, FineAmount, PaidDate) VALUES
(1, 2, 15.00, '2024-01-10'),
(2, 4, 5.00, '2024-08-02'),
(3, 5, 7.50, '2023-07-15'),
(4, 8, 12.00, '2024-06-15'),
(5, 10, 20.00, '2024-09-02');
select * from Fines;

show tables;
select * from authors;
select * from bookauthors;
select * from books;
select * from fines;
select * from loans;
select * from members;

# 3) Write a query to select all books published before 2000 from the Books table.
select * from books where PublicationYear < 2000;

# 4) Write a query to select all Loans where the LoanDate is in 2024 and the ReturnDate is NULL.
 select * from loans where year(LoanDate) = 2024 and ReturnDate is null;

# 5)  Write a query to select all Books where the Title contains 'Science'.
select * from books where Title like "%Science%";

# 6)  Write a query to select Title and a new column Availability from the Books table. If a 
# book has been loaned out (i.e., exists in Loans table with a NULL ReturnDate), set 
# Availability to 'Checked Out', otherwise 'Available'.

SELECT 
    Title, 
    CASE 
        WHEN EXISTS (SELECT 1 FROM Loans WHERE Loans.BookID = Books.BookID AND ReturnDate IS NULL) 
        THEN 'Checked Out' 
        ELSE 'Available' 
    END AS Availability
FROM Books;

# 7) Write a query to find all Members who have borrowed more than 5 books. Use a  subquery to find these MemberIDs.
select * from members;
select * from Loans;
SELECT *
FROM Members
WHERE MemberID IN (
    SELECT MemberID
    FROM Loans
    GROUP BY MemberID
    HAVING COUNT(BookID) > 5
);

# 8) Write a query to get the total number of books borrowed by each Member. Group the results by MemberID. 
SELECT MemberID, COUNT(BookID) AS TotalBorrowed 
FROM Loans 
GROUP BY MemberID;
 
# 9)   Write a query to get the total FineAmount collected for each LoanID, but only 
# include loans where the total fine amount is greater than $10. Use the HAVING clause.
select * from fines;
SELECT LoanID, SUM(FineAmount) AS TotalFine 
FROM Fines 
GROUP BY LoanID 
HAVING SUM(FineAmount) > 10;

# 10) Write a query to select the top 5 most frequently borrowed books. 
select * from loans;
SELECT BookID, COUNT(*) AS BorrowCount 
FROM Loans 
GROUP BY BookID 
ORDER BY BorrowCount DESC 
LIMIT 5;

# 11)  Write a query to join Loans with Books to get a list of all loans with Title, LoanDate, and ReturnDate.
select * from loans;
SELECT Books.Title, Loans.LoanDate, Loans.ReturnDate 
FROM Loans 
INNER JOIN Books ON Loans.BookID = Books.BookID;

# 12) Write a query to get a list of all Books and any associated loans. Include books that might not be currently borrowed.
SELECT Books.Title, Loans.LoanDate, Loans.ReturnDate 
FROM Books 
LEFT JOIN Loans ON Books.BookID = Loans.BookID;
