package com.bookexchange.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.bookexchange.dao.StateDaoImpl;
//import com.bookexchange.dao.CategoryDaoImpl;
import com.bookexchange.model.Book;
import com.bookexchange.model.User;
import com.bookexchange.service.IBookService;
import com.bookexchange.service.ICategoryService;
import com.bookexchange.service.RegistrationService;

@Controller
public class BookController {

	@Autowired
	IBookService iBookService;

	@Autowired
	ICategoryService categoryService;

	@Autowired
	StateDaoImpl stateService;

	@Autowired
	RegistrationService userService;

	@GetMapping("/book_info")
	public String getBookInformation(@RequestParam int bookId, Model model) {
		model.addAttribute("bookInfor", iBookService.getBookInformation(bookId));
		return "bookDetail";
	}

	@RequestMapping("/manager")
	public String index(Principal principal, ModelMap mm, RedirectAttributes redir) {
		if (principal == null) {
			return "redirect:/";
		}
		mm.addAttribute("book", iBookService.findBookByUser(principal.getName()));
		System.out.println(principal.getName());
		return "manager";
	}

	@GetMapping("/manager/upload")
	public String upload(ModelMap mm) {
		System.out.println(stateService.getAllCate().size());
		mm.addAttribute("cate", categoryService.getAllCate());
		mm.addAttribute("state", stateService.getAllCate());
//		Book book = new Book();
//		book.setBookTitle("test");
//		iBookService.addBook(book);
		return "upload";
	}

	@PostMapping("/manager/upload")
	public String uploaded(WebRequest wr, HttpServletRequest request, Principal principal,
			@RequestParam("myImg") CommonsMultipartFile commonsMultipartFile, RedirectAttributes rd) {
		Book book = new Book();
		User user = userService.getUserByEmail(principal.getName());
		try {
			book.setBookTitle(wr.getParameter("ten_sach"));
			book.setBookAuthor(wr.getParameter("tac_gia"));
			System.out.println(wr.getParameter("ngayxb"));
			String ngay_xb = wr.getParameter("ngayxb");

			DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate ld = LocalDate.parse(ngay_xb, dateformatter);

			LocalDateTime ldt = ld.atStartOfDay();

			book.setPublicationYear(ldt);
			book.setBookCategory(Integer.parseInt(wr.getParameter("loai_sach")));
			book.setBookState(Integer.parseInt(wr.getParameter("trang_thai")));
			try {
				book.setBookPrice(Double.parseDouble(wr.getParameter("gia")));
				book.setBookQuantity(Integer.parseInt(wr.getParameter("soluong")));
			} catch (Exception e) {
				rd.addFlashAttribute("message", "Vui lÃ²ng nháº­p thÃ´ng tin há»£p lá»‡!!!");
				return "redirect:/manager/upload";
			}

			book.setBookDescription(wr.getParameter("mo_ta"));

			book.setUserId(user.getId());
			book.setActive(true);
			String nameFile = commonsMultipartFile.getOriginalFilename();
			String dirFile = request.getServletContext().getRealPath("resources/image/");
			File fileDir = new File(dirFile);
			if (!fileDir.exists()) {
				fileDir.mkdirs();
			}
			int newID = iBookService.maxID() + 1;
			String linkFile = ("book_" + newID + "." + FilenameUtils.getExtension(nameFile));
			commonsMultipartFile.transferTo(new File(fileDir + File.separator + linkFile));
			book.setBookImage(linkFile);
			iBookService.addBook(book);
			System.out.println("Upload thành công");
			System.out.println(dirFile);

		} catch (Exception e) {
			e.printStackTrace();
			rd.addFlashAttribute("message", "Vui lòng nhập thông tin sách");
			return "redirect:/manager/upload";
		}
		rd.addFlashAttribute("message", "Thêm sách thành công");
		return "redirect:/manager/upload";
	}

	@GetMapping("/manager/delete")
	public RedirectView deleteBook(@RequestParam int bookId, Model model, RedirectAttributes redr) {
		String bookTitle = iBookService.deleteBook(bookId);
		redr.addFlashAttribute("bookNameDeleted", bookTitle);

		RedirectView redirectView = new RedirectView();
		redirectView.setContextRelative(true);
		redirectView.setUrl("/manager");
		return redirectView;
	}

	@GetMapping("/manager/edit")
	public String edit(ModelMap mm, @RequestParam int bookid) {
		Book book = iBookService.getBookInformation(bookid);
		LocalDate ld = book.getPublicationYear().toLocalDate();
		mm.addAttribute("pubDate", ld);
		mm.addAttribute("book", iBookService.getBookInformation(bookid));
		mm.addAttribute("cate", categoryService.getAllCate());
		mm.addAttribute("state", stateService.getAllCate());
		return "bookedit";
	}

	@PostMapping("manager/edit")
	public String edited(WebRequest wr, RedirectAttributes rd, HttpServletRequest request,
			@RequestParam("myImg") CommonsMultipartFile commonsMultipartFile) {
		System.out.println(commonsMultipartFile.isEmpty());
		Book book = new Book();
		Integer bookId = Integer.parseInt(wr.getParameter("bookId"));
		String bookImage = wr.getParameter("bookImage");
		String bookTitle = wr.getParameter("ten_sach");
		String bookAuthor = wr.getParameter("tac_gia");
		String ngay_xb = wr.getParameter("ngayxb");

		DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate ld = LocalDate.parse(ngay_xb, dateformatter);

		LocalDateTime ldt = ld.atStartOfDay();
		Integer categoryId = Integer.parseInt(wr.getParameter("loai_sach"));
		Integer stateId = Integer.parseInt(wr.getParameter("trang_thai"));
		String description = wr.getParameter("mo_ta");
		try {
			Double bookPrice = (Double.parseDouble(wr.getParameter("gia")));
			book.setBookPrice(bookPrice);
			Integer bookQuantity = (Integer.parseInt(wr.getParameter("soluong")));
			book.setBookQuantity(bookQuantity);
		} catch (Exception e) {
			rd.addFlashAttribute("message", "Vui lÃ²ng nháº­p thÃ´ng tin há»£p lá»‡!!!");
			return "redirect:/manager/edit?bookid=" + bookId;
		}
		book.setUserId(Integer.parseInt(wr.getParameter("userId")));
		System.out.println(bookTitle);
		book.setId(bookId);
		book.setActive(true);
		book.setBookAuthor(bookAuthor);
		book.setBookCategory(categoryId);
		book.setBookDescription(description);
		book.setBookState(stateId);
		book.setBookTitle(bookTitle);
		book.setPublicationYear(ldt);
		
		if (commonsMultipartFile.isEmpty()) {
			book.setBookImage(bookImage);
			iBookService.updateBook(book);
			rd.addFlashAttribute("message", "Update sách thành công!");
			return "redirect:/manager";
		}
		String nameFile = commonsMultipartFile.getOriginalFilename();
		String dirFile = request.getServletContext().getRealPath("resources/image/");
		File fileDir = new File(dirFile);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		String linkFile = ("book_" + bookId + "." + FilenameUtils.getExtension(nameFile).toLowerCase());
		try {
			System.out.println(linkFile);
			book.setBookImage(linkFile);
			iBookService.updateBook(book);
			commonsMultipartFile.transferTo(new File(fileDir + File.separator + linkFile));
			rd.addAttribute("message", "Update sách thành công!");
			return "redirect:/manager";
		} catch (Exception e) {
			e.printStackTrace();
			rd.addFlashAttribute("message", "Vui lòng điền thông tin hợp lệ");
			return "redirect:/manager/edit?bookid=" + bookId;
		}
	}
}
