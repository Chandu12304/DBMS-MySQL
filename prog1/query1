SELECT 
    b.book_id, 
    b.title, 
    b.publisher_name, 
    ba.author_name, 
    bc.branch_id, 
    bc.no_of_copies
FROM book b
JOIN book_authors ba ON b.book_id = ba.book_id
JOIN book_copies bc ON b.book_id = bc.book_id;
