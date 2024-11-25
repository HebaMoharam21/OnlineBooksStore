/* 1- Retrive the title of the book which has the maximum price before update*/
SELECT 
    b.Title, b.Old_Price
FROM
    Book b
WHERE
    b.old_price = (SELECT 
            MAX(b.Old_price)
        FROM
            book b);
/* 2- Retrive the title of the book which has the minimum price after update */
SELECT 
    b.Title, MIN(b.New_price)
FROM
    Book b
WHERE
    b.New_Price = (SELECT 
            MIN(b.New_price)
        FROM
            book b);
/*3- retrive title and publiched date for the books ehich where published between '23-6-1999' AND '11-6-2004' */   
SELECT 
    b.Title, b.Published
FROM
    Book b
WHERE
    published BETWEEN '1999-6-23' AND '2004-6-11';

/* 4- Retrive book id, customer username and delivary date where its delivary date 
               bwtween '2020-06-18' AND '2020-10-11'*/
SELECT 
    b.ID, c.Customer_UserName, o.D_Date
FROM
    order_by o,
    Book b,
    Customer c
WHERE
    o.D_Date BETWEEN '2020-06-18' AND '2020-10-11'
GROUP BY c.Customer_UserName ;
/*5-List the admin's username and how many times they udpadeted each one*/
SELECT 
    a.Admin_UserName, COUNT(*) AS 'count'
FROM
    Book b
        NATURAL JOIN
    Admin a
GROUP BY a.Admin_UserName;    
/*6- Retrive the book title and the category name which has the maximum sale */
SELECT 
    b.Title, b.Category_Name
FROM
    book b
WHERE
    b.Category_Name = (SELECT 
            c.Name
        FROM
            category c
        HAVING MAX(c.SALE));

 /*7- Retrive the book title and its oldp rice which has no new prices */
 SELECT 
   b.Title , b.Old_Price
FROM
    Book b
WHERE
    b.New_Price IS NULL;
/* 8- List the title, Id of the book and how many times it was ordered*/
SELECT 
    o.Book_ID, b.Title, COUNT(o.Quantity) AS count_quantity
FROM
    book b,
    customer c
        NATURAL JOIN
    order_by o
WHERE
    b.ID = o.Book_ID
GROUP BY o.Book_ID;            


/*9- Retrive the book id, title, summary and the old price whose old price is greater than average 
of old prices */
SELECT 
    ID, Title, Summary, Old_Price
FROM
    Book
WHERE
    Old_Price > (SELECT 
            AVG(Old_Price)
        FROM
            Book);
            
/*10- List all the books's id that has the same feedback for font and stars as in id='4613'*/
SELECT DISTINCT
    Book_ID
FROM
    feedback_questions
WHERE
    (stars , font) IN (SELECT 
            stars, font
        FROM
            feedback_questions
        WHERE
            Book_ID = '4613');   
