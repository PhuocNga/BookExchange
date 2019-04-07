<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "security" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<jsp:include page="menu.jsp"></jsp:include>
	<div class="container" ng-app="sliderApp">
        <hr>
        <div class="row">
            <div class="col-sm-12">
                <div class="card text-white bg-white mb-3" ng-controller="sliders">
                    <div class="card-header text-dark">
                        Sách hiện có
                    </div>
                    <div class="card-body"></div>
                    <div class="span12 home-container-left">
                        <div class="mainbox-container-v5 clearfix product-best-seller">
                            <div class="mainbox-body">
                                <div class="box-info-wrapper">
                                
                                <c:forEach items="${books}" var="book">
                                    <div class="span-4">
                                        <div class="box-info-book float-left">
                                            <div class="pic-book">
                                                <a title="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)"
                                                    class="image-border" href="/details.html">
                                                    <img class="pict lazy-img"
                                                        src="${pageContext.request.contextPath}/resources/image/${book.bookImage}"
                                                        alt="${book.bookTitle}"
                                                       />
                                                </a>
                                            </div>
                                            <div class="text-info-book">
                                                <div class="box-title-book">
                                                    <div class="title-book-small">
                                                        <a href="${pageContext.request.contextPath}/" class="product-title"
                                                            title="${book.bookTitle}">
                                                            <c:out value="${book.bookTitle}"/>
                                                        </a>
                                                    </div>
                                                    <span>Wataru WATARI </span>
                                                </div>
                                                <div class="text-content-book">
                                                    <a title="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)"
                                                        href="/details.html">
                                                        <c:set var="content" value="${fn:substring(book.bookDescription,0,90)} "/>
                                                        <c:out value="${content}..."/>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="box-info-price clearfix">
                                                <div class="box-sale-off">
                                                    <button></button>
                                                    <input type="hidden" value="${book.stateByBookState.id}" class="bookStates">
                                                </div>
                                                <div class="box-price">
                                                    <span class="price">
                                                        <span class="price-num"><fmt:formatNumber value="${book.bookPrice}"/></span>
                                                        <span class="price-num">đ</span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                        </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	jQuery(document).ready(function(){
		$.each($('.box-sale-off'),function(){
			let state=$(this).find('.bookStates').val();
			if(parseInt(state)==1){
				$(this).find('button').text('Mượng');
				$(this).find('button').addClass('btn btn-info');
			}else if(parseInt(state)==2){
				$(this).find('button').text('Bán');
				$(this).find('button').addClass('btn btn-danger');
			}else if(parseInt(state)==3){
				$(this).find('button').text('Trao đổi');
				$(this).find('button').addClass('btn btn-warning');
			}
		})
	})
</script>
</html>