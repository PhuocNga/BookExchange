<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<!--/.Navbar -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card text-white bg-white mb-3">
					<div class="card-header text-dark h4">Kho sách cá nhân</div>
					<div class="card-body bg-white">
						<a class="btn btn-sm btn-primary mb-5"> <i class="fa fa-upload"></i>
							Thêm sách
						</a>
						<table id="dtBasicExample"
							class="table table-striped table-bordered" cellspacing="0"
							width="100%">
							
							<div class="alert alert-danger">
						    	<strong>Xóa sách ${bookNameDeleted} thành công</strong>
						  	 </div>
							<thead>
							
								<tr>
									<th class="th-sm">Ảnh</th>
									<th class="th-sm">Tên sách</th>
									<th class="th-sm">Tác giả</th>
									<th class="th-sm">Loại</th>
									<th class="th-sm">Giá sách</th>
									<th class="th-sm">Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${book}" var="book">
									<tr>
										<td>
											<img 
											style="width: 150px; height: 150px"
											src="${pageContext.request.contextPath}/resources/image/${book.bookImage}" />
										</td>
										<td>${book.bookTitle}</td>
										<td>${book.bookAuthor}</td>
										<td>${book.bookcategoryByBookCategory.category}</td>
										<td>${book.bookPrice}</td>
										<td><a class="btn btn-sm btn-default" style="width: 100%">
												<i class="fa fa-pencil-square-o"></i> Sửa
										</a>
										<a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#book${book.id}" style="width: 100%"> <i
												class="fa fa-trash"></i> Xóa
										</a>
										
										<div class="modal fade" id="book${book.id}">
										    <div class="modal-dialog">
										      <div class="modal-content">
										      
										        <!-- Modal Header -->
										        <div class="modal-header">
										          <h4 class="modal-title">Thông báo xóa</h4>
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										        </div>
										        
										        <!-- Modal body -->
										        <div class="modal-body">
										          <h5>Bạn có chắt xóa sách <span style="color: red">${book.bookTitle}</span></h5>
										        </div>
										        
										        <!-- Modal footer -->
										       <div class="modal-footer">
										       	  <a href="${pageContext.request.contextPath}/manager/delete?bookId=${book.id}"><button type="button" class="btn btn-danger">Xóa</button></a>
										          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										        </div>
										        
										      </div>
										    </div>
										  </div>
										  
										</td>
										
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>Ảnh</th>
									<th>Tên sách</th>
									<th>Tác giả</th>
									<th>Loại</th>
									<th>Giá</th>
									<th>Thao tác</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${bookNameDeleted}" id="message">
	<script>
		$(document).ready(function() {
			$('#dtBasicExample').DataTable();
			$('.dataTables_length').addClass('bs-select');
		});
	</script>
	<script>
		$('.alert-danger').hide();
		var message=$('#message');
		if(message!=null){
			$('.alert-danger').fadeOut(1000);	
		}
	
	</script>
</body>
</html>