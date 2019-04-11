package com.bookexchange.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.Collection;

@Entity(name = "User")
public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String confirmPassword;
	private Collection<Book> booksById;
	private String address;
	private String numberPhone;

	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Basic
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Basic
	@Column(name = "email", nullable = true, length = 320)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Basic
	@Column(name = "password", nullable = true, length = 300)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		User user = (User) o;

		if (id != user.id)
			return false;
		if (name != null ? !name.equals(user.name) : user.name != null)
			return false;
		if (name != null ? !name.equals(user.name) : user.name != null)
			return false;
		if (email != null ? !email.equals(user.email) : user.email != null)
			return false;
		if (password != null ? !password.equals(user.password) : user.password != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = id;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (email != null ? email.hashCode() : 0);
		result = 31 * result + (password != null ? password.hashCode() : 0);
		return result;
	}

	@OneToMany(mappedBy = "userByUserId", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JsonManagedReference
	public Collection<Book> getBooksById() {
		return booksById;
	}

	public void setBooksById(Collection<Book> booksById) {
		this.booksById = booksById;
	}

	@Transient
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	@Basic
	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Basic
	@Column(name="numberPhone")
	public String getNumberPhone() {
		return numberPhone;
	}

	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}

}
