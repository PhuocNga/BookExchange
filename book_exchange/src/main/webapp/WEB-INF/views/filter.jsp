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
                                <div class="box-info-wrapper" id="pagination">
                                
                                <c:forEach items="${books}" var="book">
                                    <div class="span-4">
                                        <div class="box-info-book float-left">
                                            <div class="pic-book">
                                                <a title="${book.bookTitle}"
                                                    class="image-border" href="${pageContext.request.contextPath}/book_info?bookId=${book.id}">
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
                                                    <a title="${book.bookTitle}"
                                                        href="${pageContext.request.contextPath}/book_info?bookId=${book.id}">
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
								<input type="text" value="1" style="display: none;" id="currentPage">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script>

	function setState(state){
		if(parseInt(state)==1){
			return '<div class="box-sale-off"><button class="btn btn-info">Mượn</button></div>';
		}
		if(parseInt(state)==2){
			return '<div class="box-sale-off"><button class="btn btn-danger">Bán</button></div>';		
		}
		if(parseInt(state)==3){
			return '<div class="box-sale-off"><button class="btn btn-warning">Trao đổi</button></div>';
		}
		
	}
	
	function formatNumber(pnumber)
	{
		return (pnumber+'').replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
	}

	jQuery(document).ready(function(){
			var currentPage = $('#currentPage').val();
			$(window).scroll(function() {
			   if($(window).scrollTop() + $(window).height() == $(document).height()) {
				   $('#currentPage').val(parseInt($('#currentPage').val())+1);
			       $.ajax({
			    	  'url': '/book_exchange/paginaion-category?page='+$('#currentPage').val()+"&category="+'${catogory}',
			    	  'type': 'GET',
			    	  'dataType': 'json',
			    	  'Content-type': 'application/json',
			    	  success: function(data){
			    		  data.forEach(function(book){
			    			  
				    		  $('#pagination').append(
				    				  '<div class="span-4">'+
			                           '<div class="box-info-book float-left">'+
			                               '<div class="pic-book">'+
			                                   '<a title="'+book.bookTitle+'" class="image-border" href="${pageContext.request.contextPath}/book_info?bookId='+book.id+'"><img class="pict lazy-img" src="${pageContext.request.contextPath}/resources/image/'+book.bookImage+'" alt="'+book.bookTitle+'"/></a>'+
			                               '</div>'+
			                            	'<div class="text-info-book">'+
			                                   	'<div class="box-title-book"><div class="title-book-small"><a href="${pageContext.request.contextPath}/" class="product-title" title="'+book.bookTitle+'">'+ book.bookTitle+'"/></a></div><span>Wataru WATARI </span></div>'+
			                                  	'<div class="text-content-book"><a title="'+book.bookTitle+'" href="${pageContext.request.contextPath}/book_info?bookId='+book.id+'">'+book.bookDescription.substring(0,90)+'...</a></div>'+
			                              	'</div>'+
			                              '<div class="box-info-price clearfix">'+ setState(book.bookState)+'<div class="box-price"><span class="price"><span class="price-num">'+formatNumber(book.bookPrice)+'</span><span class="price-num">đ</span></span></div></div>'+
			                          ' </div>'+
			                      ' </div>');
			    		  });
			    	  },
			    	  error: function(err){
			    		  console.log($('#currentPage').val());
			    	  }
			       });
			   }
			});
		
			
		
		$.each($('.box-sale-off'),function(){
			let state=$(this).find('.bookStates').val();
			if(parseInt(state)==1){
				$(this).find('button').text('Mượn');
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