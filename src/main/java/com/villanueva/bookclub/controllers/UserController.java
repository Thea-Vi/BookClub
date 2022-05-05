package com.villanueva.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.villanueva.bookclub.models.Book;
import com.villanueva.bookclub.models.LoginUser;
import com.villanueva.bookclub.models.User;
import com.villanueva.bookclub.services.BookService;
import com.villanueva.bookclub.services.UserService;

@Controller
public class UserController {

//	CONTROLLER TALKS TO THE SERVICE
	@Autowired
	private UserService userService;

	@Autowired
	private BookService bookService;

	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "redirect:/";
		}

		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "log&reg.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, HttpSession session,
			Model model) {

		userService.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());

			return "log&reg.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/home";

	}

	@PostMapping("/login")
	public String register(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result,
			HttpSession session, Model model) {

		User user = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());

			return "log&reg.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/home";

	}

	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		Long loggedInUserId = (Long) session.getAttribute("user_id");
		System.out.println(loggedInUserId);

////		Log out
		if (loggedInUserId == null) {
			return "redirect:/";
		}

//		GET USER TO SHOW ON TEMPLATE
		User loggedInUser = this.userService.findUser(loggedInUserId);
		model.addAttribute("loggedInUser", loggedInUser);

//		Service to get all the books and store in a variable
		List<Book> allBooks = this.bookService.findAllBooks();

//		pass the variable to the template  -- back to frontend;
		model.addAttribute("allBooks", allBooks);

		return "dashboard.jsp";

	}
// LOGOUT 

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		return "redirect:/";

	}

//	============ BOOK ==========

	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book) {

		return "newbook.jsp";
	}

	@PostMapping("/books/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			return "newbook.jsp";
		}

//		get the id of logged in user
//		cast to LONG
		Long loggedInUser = (Long) session.getAttribute("user_id");

//		after getting the ID, the logged in user object is now available
		User loggedInUserObjUser = this.userService.findUser(loggedInUser);

//		set the object to that user 
		book.setUser(loggedInUserObjUser);

//		send the data from form  database
		this.bookService.createBook(book);

		return "redirect:/home";

	}

//	GET BOOK DETAIL
	@GetMapping("/book/info/{id}")
	public String displayBook(@PathVariable("id") Long id, Model model) {

//		get book from the database by going through service
//		then store the in a variable the obj from the database
//		always attach the data type - class when assigning a variable
		Book bookObj = this.bookService.getBook(id);

//		pass "bookObj" to the templates
		model.addAttribute("bookObj", bookObj);

		return "details.jsp";

	}

//	EDIT FORM
	@GetMapping("book/{id}/edit")
	public String editBook(@PathVariable("id") Long id, Model model) {
//		get book from the database by going through service
//		then store the in a variable the obj from the database
//		always attach the data type - class when assigning a variable

		Book bookObj = this.bookService.getBook(id);

//		pass "editObjBook" to the templates
		model.addAttribute("bookObj", bookObj);

		return "edit.jsp";

	}

//	POST -- UPDATE FROM EDIT FORM
	@PostMapping("books/{id}/update")
	public String updateBook(@PathVariable("id") Long id, @Valid @ModelAttribute("bookObj") Book book,
			BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
//			if there's errors in the form, return that form
			return "edit.jsp";
		} else {
//			get the book obj to update form
			System.out.println(book.getTitle());
			System.out.println(book.getAuthor());
			System.out.println(book.getThoughts());

//			GET THE LOGGED IN USER USING SESSION - UPDATES THE NEW USER WHO EDITED THE FORM
//			needs to cast it (Long) data type because session converts it to something else
			Long loggedInUserIdLong = (Long) session.getAttribute("user_id");

//			get the userid from session and uses findUser method from userService to store in a variable to be used.
			User loggedInUserObjUser = this.userService.findUser(loggedInUserIdLong);

//			assign the book's uploader to be the logged in user
			book.setUser(loggedInUserObjUser);

//			if the id cant be found
//			book.setId(id);
			this.bookService.updateBook(book);
		}

		return "redirect:/home";
	}

//	SHOW ONE USER WITH ALL BOOKS BELONGING TO THIS USER

	@GetMapping("/users/{id}")
	public String displayOneUser(@PathVariable("id") Long id, Model model) {

//		call service
		User user = userService.findUser(id);

		model.addAttribute("user", user);
		return "userdetails.jsp";
	}

////	DELETE
	@GetMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {

		this.bookService.deleteBook(id);

		return "redirect:/home";
	}

}

//DELETE

//@RequestMapping(value = "/books/{id}", method = RequestMethod.DELETE)
//public String destroy(@PathVariable("id") Long id) {
//	bookService.deleteBook(id);
//	return "redirect:/home";
//}
