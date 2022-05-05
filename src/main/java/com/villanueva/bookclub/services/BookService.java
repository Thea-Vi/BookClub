package com.villanueva.bookclub.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.villanueva.bookclub.models.Book;
import com.villanueva.bookclub.repositories.BookRepository;

@Service
public class BookService {
//	
//	@Autowired
//	private BookRepository bookRepository;

//	OPTION2
	private final BookRepository bookRepository;

	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}

//	METHODS

//FIND ALL BBOOKS

	public List<Book> findAllBooks() {
		return (List<Book>) this.bookRepository.findAll();
	}

//	CREATE A NEW BOOK
	public Book createBook(Book book) {
		return this.bookRepository.save(book);
	}

//	GET ONE BOOK
	public Book getBook(Long id) {
//		or else (returns null if the id does not exist in the database)
		return this.bookRepository.findById(id).orElse(null);
	}

//	UPDATE BOOK
	public Book updateBook(Book book) {
		return this.bookRepository.save(book);
	}

//	DELETE BOOK
	public void deleteBook(Long id) {
		this.bookRepository.deleteById(id);
	}

}
