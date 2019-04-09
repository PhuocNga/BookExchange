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
<title>Book detail</title>
<style type="text/css">
	.col-md-12{
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
<jsp:include page="menu.jsp"/>
	  <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" style="margin: 5px -15px">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/"><i class="fa fa-home"></i> Trang chủ</a></li>
                <li class="breadcrumb-item active"><i class="fa fa-star"></i> Thông tin sách</li>
            </ol>
        </nav>
        <c:set value="${bookInfor}" var="bookInfo"/>
        <div class="row">
            <div class="col-sm-9 row">
                <div class="col-sm-4 bg-white">
                    <img src="${pageContext.request.contextPath}/resources/image/${bookInfo.bookImage}"
                        width="100%" class="img-fluid img-thumbnail" alt="Responsive image"
                        style="width: 100%; height: 100%">
                </div>
                <div class="col-sm-8 bg-white border">
                    <h3>${bookInfo.bookTitle}</h3>
                    <h6>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <span class="text-primary"> Không có đánh giá</span>
                    </h6>
                    <h6>Tác giả  <span class="text-primary">${bookInfo.bookAuthor}</span></h6>
                    <h6>Năm xuất bản <span class="text-primary">${bookInfo.publicationYear}</span></h6>
                    <hr>
                    <h6>Số lượng <span class="text-danger">39</span></h6>
                    <h6>Trạng thái:<button class="btn btn-danger"> ${bookInfo.stateByBookState.state}</button></h6>
                </div>
                <div class="col-sm-12 bg-white mb-2" style="padding: 0 -15px">
                    <div aria-label="breadcrumb">
                        <div class="breadcrumb breadc" style="margin: 5px -15px; border-radius: 0">
                            <p class="h5">Mô tả chi tiết</p>
                        </div>
                    </div>
                    <div class="p-2" style="font-size: 15px">
                      <c:out value="${bookInfo.bookDescription}"/>
                    </div>
                </div>
                <div class="col-sm-12 bg-white" style="padding: 0 -15px">
                    <div aria-label="breadcrumb">
                        <div class="breadcrumb breadc" style="margin: 5px -15px; border-radius: 0">
                            <p class="h5">Sách khác</p>
                        </div>
                    </div>
                    <div class="p-2" style="font-size: 15px">
                        <div class="col-sm-12 home-container-left">
                            <div class="mainbox-container-v5 clearfix product-best-seller">
                                <div class="mainbox-body">
                                    <div class="box-info-wrapper row">
                                        <div class="col-sm-4">
                                            <div class="box-info-book float-left">
                                                <div class="pic-book">
                                                    <a title="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)"
                                                        class="image-border">
                                                        <img class="pict lazy-img"
                                                            src="https://www.vinabook.com/images/thumbnails/product/240x/331997_p86816mchuyenlinh.jpg"
                                                            alt="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)"
                                                            width="115" height
                                                            title="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)"
                                                            style="opacity: 1;"
                                                            data-src="https://www.vinabook.com/images/thumbnails/product/240x/331997_p86816mchuyenlinh.jpgww.vinabook.com/images/thumbnails/product/240x/331997_p86816mchuyenlinh.jpg" />
                                                    </a>
                                                </div>
                                                <div class="text-info-book">
                                                    <div class="box-title-book">
                                                        <div class="title-book-small">
                                                            <a href="https://www.vinabook.com/ehon-nhat-ban-cau-chuyen-ve-ban-chan-p81578.html&#10;                        "
                                                                class="product-title"
                                                                title="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)">
                                                                Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai
                                                                Lầm - Tập
                                                                6 (Tặng Kèm Poster)
                                                            </a>
                                                        </div>
                                                        <span>Wataru WATARI </span>
                                                    </div>
                                                    <div class="text-content-book">
                                                        <a title="Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 6 (Tặng Kèm Poster)"
                                                            href="https://www.vinabook.com/ehon-nhat-ban-cau-chuyen-ve-ban-chan-p81578.html">
                                                            Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm.
                                                            (tên
                                                            gốc: Yahari...
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="box-info-price clearfix">
                                                    <div class="box-sale-off">
                                                        -20%
                                                    </div>
                                                    <div class="box-price">
                                                        <span class="price">
                                                            <span class="price-num">39.000</span>
                                                            <span class="price-num">đ</span>
                                                        </span>
                                                    </div>
                                                    <div class="box-old-price">
                                                        <span class="old_price_update">
                                                            <span class="list-price">
                                                                <span class="strike">
                                                                    <span class="list-price nowrap">
                                                                        49.000đ
                                                                    </span>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="sidebar-item">
                    <div class="make-me-sticky">
                        <div class="card text-white bg-white com-sm-12" style="margin-right: -45px">
                            <div class="card-header text-dark">
                                <i class="fa fa-book"></i> Thông tin người đăng
                            </div>
                    <div style="color: black">
                        <div class="row" style="padding: 10px 10px 10px 20px">
                            <div class="col-md-12"><h6>Tên: <strong>${bookInfo.userByUserId.name}</strong></h6></div>
                            <div class="col-md-12"><h6>Email: <strong>${bookInfo.userByUserId.email}</strong></h6></div>
                            <div class="col-md-12"><h6>Địa chỉ: <strong>${bookInfo.userByUserId.address}</strong></h6></div>
                            <div class="col-md-12"><h6>Điện thoại: <strong>${bookInfo.userByUserId.numberPhone}</strong></h6></div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>