SELECT card_no, COUNT(book_id) AS total_books_borrowed
FROM book_lending
WHERE date_out BETWEEN '2011-01-01' AND '2019-06-30'
GROUP BY card_no
HAVING COUNT(book_id) > 3;
