CREATE VIEW available_books AS
SELECT bc.book_id, SUM(bc.no_of_copies) AS available_copies
FROM book_copies bc
WHERE NOT EXISTS (
    SELECT 1 FROM book_lending bl
    WHERE bc.book_id = bl.book_id
    AND bc.branch_id = bl.branch_id
)
GROUP BY bc.book_id;
