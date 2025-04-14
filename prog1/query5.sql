SELECT 
    bc.book_id,
    b.title,
    bc.no_of_copies - IFNULL(l.lended, 0) AS available_copies
FROM book_copies bc
JOIN book b ON bc.book_id = b.book_id
LEFT JOIN (
    SELECT book_id, branch_id, COUNT(*) AS lended
    FROM book_lending
    GROUP BY book_id, branch_id
) l ON bc.book_id = l.book_id AND bc.branch_id = l.branch_id
WHERE (bc.no_of_copies - IFNULL(l.lended, 0)) > 0;
