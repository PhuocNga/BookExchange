package com.bookexchange.model;

import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonBackReference;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.time.LocalDateTime;

@Entity
public class Book {
	private int id;
	private String bookTitle;
	private String bookAuthor;
	private LocalDateTime publicationYear;
	private Integer bookCategory;
	private Integer userId;
	private Boolean isActive;
	private String bookImage;
	private Double bookPrice;
	private Integer bookQuantity;
	private String bookDescription;
	private Integer bookState;
	private Bookcategory bookcategoryByBookCategory;
	private User userByUserId;
	private State stateByBookState;

	@Id
	@Column(name = "id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name = "bookTitle", nullable = true, length = 500)
	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	@Basic
	@Column(name = "bookAuthor", nullable = true, length = 500)
	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	@Basic
	@Column(name = "publicationYear")
	public LocalDateTime getPublicationYear() {
		return publicationYear;
	}

	public void setPublicationYear(LocalDateTime publicationYear) {
		this.publicationYear = publicationYear;
	}

	@Basic
	@Column(name = "bookCategory", nullable = true)
	public Integer getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(Integer bookCategory) {
		this.bookCategory = bookCategory;
	}

	@Basic
	@Column(name = "userId", nullable = true)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Basic
	@Column(name = "isActive", nullable = true)
	public Boolean getActive() {
		return isActive;
	}

	public void setActive(Boolean active) {
		isActive = active;
	}

	@Basic
	@Column(name = "bookImage", nullable = true, length = 500)
	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	@Basic
	@Column(name = "bookPrice", nullable = true, precision = 2)
	public Double getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}

	@Basic
	@Column(name = "bookQuantity", nullable = true)
	public Integer getBookQuantity() {
		return bookQuantity;
	}

	public void setBookQuantity(Integer bookQuantity) {
		this.bookQuantity = bookQuantity;
	}

	@Basic
	@Column(name = "bookDescription", nullable = true, length = -1)
	public String getBookDescription() {
		return bookDescription;
	}

	public void setBookDescription(String bookDescription) {
		this.bookDescription = bookDescription;
	}

	@Basic
	@Column(name = "bookState", nullable = true)
	public Integer getBookState() {
		return bookState;
	}

	public void setBookState(Integer bookState) {
		this.bookState = bookState;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		Book book = (Book) o;

		if (id != book.id)
			return false;
		if (bookTitle != null ? !bookTitle.equals(book.bookTitle) : book.bookTitle != null)
			return false;
		if (bookAuthor != null ? !bookAuthor.equals(book.bookAuthor) : book.bookAuthor != null)
			return false;
		if (publicationYear != null ? !publicationYear.equals(book.publicationYear) : book.publicationYear != null)
			return false;
		if (bookCategory != null ? !bookCategory.equals(book.bookCategory) : book.bookCategory != null)
			return false;
		if (userId != null ? !userId.equals(book.userId) : book.userId != null)
			return false;
		if (isActive != null ? !isActive.equals(book.isActive) : book.isActive != null)
			return false;
		if (bookImage != null ? !bookImage.equals(book.bookImage) : book.bookImage != null)
			return false;
		if (bookPrice != null ? !bookPrice.equals(book.bookPrice) : book.bookPrice != null)
			return false;
		if (bookQuantity != null ? !bookQuantity.equals(book.bookQuantity) : book.bookQuantity != null)
			return false;
		if (bookDescription != null ? !bookDescription.equals(book.bookDescription) : book.bookDescription != null)
			return false;
		if (bookState != null ? !bookState.equals(book.bookState) : book.bookState != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = id;
		result = 31 * result + (bookTitle != null ? bookTitle.hashCode() : 0);
		result = 31 * result + (bookAuthor != null ? bookAuthor.hashCode() : 0);
		result = 31 * result + (publicationYear != null ? publicationYear.hashCode() : 0);
		result = 31 * result + (bookCategory != null ? bookCategory.hashCode() : 0);
		result = 31 * result + (userId != null ? userId.hashCode() : 0);
		result = 31 * result + (isActive != null ? isActive.hashCode() : 0);
		result = 31 * result + (bookImage != null ? bookImage.hashCode() : 0);
		result = 31 * result + (bookPrice != null ? bookPrice.hashCode() : 0);
		result = 31 * result + (bookQuantity != null ? bookQuantity.hashCode() : 0);
		result = 31 * result + (bookDescription != null ? bookDescription.hashCode() : 0);
		result = 31 * result + (bookState != null ? bookState.hashCode() : 0);
		return result;
	}

	
    @JsonBackReference
    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn(name = "bookCategory", referencedColumnName = "id", updatable = false, insertable = false,unique = true)
	public Bookcategory getBookcategoryByBookCategory() {
		return bookcategoryByBookCategory;
	}

	public void setBookcategoryByBookCategory(Bookcategory bookcategoryByBookCategory) {
		this.bookcategoryByBookCategory = bookcategoryByBookCategory;
	}

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "userId", referencedColumnName = "id", insertable = false, updatable = false)
	public User getUserByUserId() {
		return userByUserId;
	}

	public void setUserByUserId(User userByUserId) {
		this.userByUserId = userByUserId;
	}

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "bookState", referencedColumnName = "id", insertable = false, updatable = false)
	public State getStateByBookState() {
		return stateByBookState;
	}

	public void setStateByBookState(State stateByBookState) {
		this.stateByBookState = stateByBookState;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", bookTitle=" + bookTitle + ", bookAuthor=" + bookAuthor + ", publicationYear="
				+ publicationYear + ", bookCategory=" + bookCategory + ", userId=" + userId + ", isActive=" + isActive
				+ ", bookImage=" + bookImage + ", bookPrice=" + bookPrice + ", bookQuantity=" + bookQuantity
				+ ", bookDescription=" + bookDescription + ", bookState=" + bookState + ", bookcategoryByBookCategory="
				+ bookcategoryByBookCategory + ", userByUserId=" + userByUserId + ", stateByBookState="
				+ stateByBookState + "]";
	}
}
