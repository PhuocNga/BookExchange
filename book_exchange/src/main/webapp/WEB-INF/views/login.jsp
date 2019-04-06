<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.col-md-12{
	padding:1px 500px 10px 500px;
}
form[name=login_form]{
padding-left: 400px;
padding-right: 400px;
}
.button2 {background-color: #008CBA;}
#title{
	text-align: center;
	font-family: cursive !important;
}
.container{
padding-top: 5%
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
            <h2 id="title">Đăng nhập</h2>
             <form name="login_form" method="POST" action="${pageContext.request.contextPath }/loginProcesses">
             	<div class="row">
             		<div class="col-md-12"><input class="form-control" placeholder="Nhập email của bạn" type="email" name="username" required></div>
             		<div class="col-md-12"><input class="form-control" placeholder="Nhập mật khẩu của bạn" type="password" name="password" required></div>
             		<div class="col-md-12" style="color: red;font-size: 16px"><c:out value="${loginFail}"/></div>
             		<div class="col-md-12"><button class="button button2">Đăng nhập</button></div>
             	</div>
             </form>
            </div>
        </div>

    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>