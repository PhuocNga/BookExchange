<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<!--/.Navbar -->
	<div class="container">
		<form action="${pageContext.request.contextPath}/manager/edit"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="bookId" value="${book.id}">
			<input type="hidden" name="bookImage" value="${book.bookImage}">
			<input type="hidden" name="userId" value="${book.userId}">
			<div class="row">
				<div class="col-sm-12">
					<div class="card text-white bg-white mb-3">
						<div class="card-header text-dark">Đăng sách</div>
						<div style="color: red;" class="text-center h5 mt-2">${message}</div>
						<div class="card-body bg-white">
							<div class="row">
								<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
									<img id="myImg"
										src="${pageContext.request.contextPath}/resources/image/${book.bookImage}"
										style="width: 100%; height: 480px;" /> <span
										class="btn btn-default btn-file"
										style="margin: 6px 0px; width: 100%"> Chọn ảnh <input
										type="file" name="myImg">
									</span>
								</div>
								<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-black-50"
									style="margin-left: auto">

									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Tên sách</label>
										<div class="col-sm-9">
											<input type="text" value="${book.bookTitle}"
												class="form-control" placeholder="Nhập tên sách"
												required="required" name="ten_sach">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Tác giả</label>
										<div class="col-sm-9">
											<input type="text" value="${book.bookAuthor}"
												class="form-control" placeholder="Nhập tên tác giả"
												required="required" name="tac_gia">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Ngày xuất bản</label>
										<div class="col-sm-9">
											<input type="date" value="${pubDate}"
												class="form-control" placeholder="Ngày xuất bản"
												name="ngayxb">
										</div>
									</div>
									${pubDate}
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Loại sách</label>
										<div class="col-sm-9">
											<select name="loai_sach" class="form-control">
												<c:forEach items="${cate}" var="cate">
													<option 
													<c:if test="${cate.id == book.bookCategory}">
													selected
													</c:if>
													value="${cate.id}">${cate.category }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Trạng thái</label>
										<div class="col-sm-9">
											<select name="trang_thai" class="form-control">
												<c:forEach items="${state}" var="state">
													<option
														<c:if test = "${book.bookState == state.id}">
													selected
													</c:if>
														value="${state.id}">${state.state }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Giá</label>
										<div class="col-sm-9">
											<input type="number" value="${book.bookPrice}"
												class="form-control" placeholder="Nhập giá"
												required="required" name="gia">
										</div>
									</div>
									<div class="form-group row">
										<label for="inputEmail3" class="col-sm-3 col-form-label">Số
											lượng</label>
										<div class="col-sm-9">
											<input type="number" value="${book.bookQuantity}"
												class="form-control" placeholder="Nhập số lượng"
												required="required" name="soluong">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-3">Mô tả</div>
										<div class="col-sm-9">
											<textarea name="mo_ta" class="form-control" rows="3">${book.bookDescription}</textarea>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-3"></div>
										<div class="col-sm-9">
											<button type="submit" class="btn btn-default">Update</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		$(function() {
			$(":file").change(function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader();
					reader.onload = imageIsLoaded;
					reader.readAsDataURL(this.files[0]);
				}
			});
		});

		function imageIsLoaded(e) {
			$('#myImg').attr('src', e.target.result);
		};
	</script>
</body>
</html>