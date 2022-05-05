package com.villanueva.bookclub.repositories;

import org.springframework.data.repository.CrudRepository;

import com.villanueva.bookclub.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {

}
