-- Получение списка всех книг:
SELECT * FROM books;
-- Получение списка читателей, отсортированного по фамилии в алфавитном порядке:
SELECT * FROM readers ORDER BY last_name;
-- Получение количества выданных книг для каждого жанра:
SELECT genre, COUNT(*) AS total_loans FROM book_loans
JOIN books ON book_loans.book_id = books.book_id
GROUP BY genre;
-- Получение списка читателей, которые еще не вернули книги:
SELECT readers.first_name, readers.last_name, books.title, book_loans.loan_date FROM book_loans
JOIN readers ON book_loans.reader_id = readers.reader_id
JOIN books ON book_loans.book_id = books.book_id
WHERE book_loans.returned = false;