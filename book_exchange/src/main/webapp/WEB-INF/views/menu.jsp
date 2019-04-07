<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "security" %>
<!DOCTYPE html>
<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/bs4/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/bs4/css/mdb.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bs4/css/style.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/owl/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/owl/assets/owl.theme.default.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bs4/css/npc.css" />

    <script src="${pageContext.request.contextPath}/resources/bs4/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bs4/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bs4/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/owl/owl.carousel.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

      <script>
  		jQuery(document).ready(function(){
  			$('.alert-danger').hide()
  			$('#registerButton').on('click',function(e){
  				e.preventDefault();
  				$('.error').remove();
  				$.ajax({
  					method:'POST',
  					url:'${pageContext.request.contextPath}/signup',
  					data:$('form[name=registerForm]').serialize(),
  					success:function(data){
  						if(data.error){
  						$.each(data.errorMap,function(i,v){
  							$('input[name='+i+']').after('<p class="error">'+v+'</p>');
  						});
  						}else{
  							$('.ml-auto').click();
  							$('.alert-danger').show();
  							$('.alert-danger').fadeOut(8000);
  						}
  					}
  				})			
  			})
  		})
    </script>
    <style>
    .error{
    	color:red;
    }
    </style>
</head>
<body>
	
	<nav class="mb-1 navbar navbar-expand-lg navbar-dark default-color sticky-top">
        <img src="https://mdbootstrap.com/img/logo/mdb-transparent.png" height="30" alt="mdb logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
            aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/"><i class="fa fa-home"></i> Trang chủ
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"><i class="fa fa-list"></i> Loại sách
                    </a>
                    <div style="columns: 1;" class="dropdown-menu dropdown-default"
                        aria-labelledby="navbarDropdownMenuLink-333">
                        <a class="dropdown-item" href="./search.html">Tìm kiếm</a>
                        <a class="dropdown-item" href="./upbook.html">Đăng sách</a>
                        <a class="dropdown-item" href="./details.html">Chi tiết sản phẩm</a>
                        <a class="dropdown-item" href="./confirm.html">Thông tin đặt sách</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-search-minus"></i> Tìm nâng cao</a>
                </li>
            </ul>
            <!-- Alert success message -->
            
			<div class="alert alert-danger">
		    <strong style="font-size: 18px">Tài khoản kích hoạt thành công! </strong>
		  	</div>
		  	
		  	
            <ul class="navbar-nav ml-auto nav-flex-icons">
                <form class="form-inline my-2 my-lg-0 ml-auto">
                    <input class="form-control" type="search" placeholder="Nhập tên sách" aria-label="Nhập tên sách">
                    <button class="btn btn-outline-white btn-md my-2 my-sm-0 ml-3" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
                
                <security:authorize access="isAuthenticated()">
                  <div class="hello"><strong><h6 style="padding-top: 8px;color: white">Xin chào: <security:authentication property="principal.username"/> </h6></strong></div>
                </security:authorize>
                
                <security:authorize access="!isAuthenticated()">
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="modal" data-target="#modalLRForm">
                        <i class="fas fa fa-user"></i> Đăng ký
                    </a>
                </li>
                
                 <li class="nav-item dropdown">
                    <a class="nav-link" href="${pageContext.request.contextPath}/signin">
                        <i class="fas fa fa-user"></i> Đăng nhập
                    </a>
                </li>
                </security:authorize>
                
                <security:authorize access="isAuthenticated()">
               <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        <i class="fas fa fa-user"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-default"
                        aria-labelledby="navbarDropdownMenuLink-333">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/manager">
                            <i class="fa fa-list"></i> Kho sách cá nhân
                        </a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/manager/upload">
                            <i class="fa fa-upload"></i> Đăng sách
                        </a>
                        <a class="dropdown-item border-bottom" href="${pageContext.request.contextPath}/personalManage">
                            <i class="fa fa-cart-plus"></i> Giao dịch cá nhân
                        </a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/customerRequestManage">
                            <i class="fa fa-cog"></i> Yêu cầu giao dịch khách hàng
                        </a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                            <i class="fa fa-sign-out"></i> Đăng xuất
                        </a>
                    </div>
                </li>
                </security:authorize>
                
            </ul>
        </div>
    </nav>
    
<!-- Login modal-->
 <div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog cascading-modal" role="document">
            <!--Content-->
            <div class="modal-content">

                <!--Modal cascading tabs-->
                <div class="modal-c-tabs">

                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
                        <li class="nav-item active text-white">
                            <a class="nav-link text-white" style="background-color: inherit" data-toggle="tab"
                                href="#panel8" role="tab"><i class="fa fa-user-plus mr-1"></i>
                                Đăng ký tài khoản</a>
                        </li>
                    </ul>

                    <!-- Tab panels -->
                    <div class="tab-content">
                        <!--Panel 8-->
                        <div class="tab-pane fade in show active" id="panel8" role="tabpanel">
                            <!--Body-->
                            <div class="modal-body">
                            <form name="registerForm">
                                <div class="md-form form-sm mb-5">
                                    <i class="fa fa-envelope prefix"></i>
                                    <input type="text" id="modalLRInput12"
                                        class="form-control form-control-sm validate" name="email" placeholder="email">
                                </div>
                                
                                <div class="md-form form-sm mb-4">
                                    <i class="fa fa-user prefix"></i>
                                    <input type="text" class="form-control form-control-sm validate" name="name" placeholder="Tên">
                                </div>
                                

                                <div class="md-form form-sm mb-5">
                                    <i class="fa fa-lock prefix"></i>
                                    <input type="password" id="modalLRInput13"
                                        class="form-control form-control-sm validate" name="password" placeholder="Mật khẩu">
                                </div>

                                <div class="md-form form-sm mb-4">
                                    <i class="fa fa-lock prefix"></i>
                                    <input type="password" id="modalLRInput19"
                                        class="form-control form-control-sm validate" name="confirmPassword" placeholder="Nhập lại mật khẩu">
                                    
                                </div>

                                <div class="text-center form-sm mt-2">
                                    <button class="btn btn-info" style="width: 100%" type="submit" id="registerButton">Register <i
                                            class="fa fa-sign-in ml-1" ></i></button>
                                </div>
								</form>
                            </div>
                            <!--Footer-->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-sm btn-outline-info waves-effect ml-auto"
                                    data-dismiss="modal"><i class="fa fa-close"></i></button>
                            </div>
                        </div>
                        <!--/.Panel 8-->
                    </div>

                </div>
            </div>
            <!--/.Content-->
        </div>
    </div>
  
</body>
</html>