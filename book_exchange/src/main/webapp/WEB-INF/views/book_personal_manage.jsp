<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giao dịch cá nhân</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
	<div class="container" ng-app="sliderApp">
        <div class="">
            <div class="card text-white bg-white mb-3" ng-controller="sliders">
                <div class="card-header text-dark">
                    <form class="form-inline">
                        <label>
                            <h4><i class="fa fa-star"></i>Giao dịch cá nhân
                            </h4>
                        </label>
                        <select id="mySelect" class="float-right form-control col-sm-3" onchange="selectRequiment()"
                            style=" margin-left: auto">
                            <option value="Mượn">Yêu cầu mượn</option>
                            <option value="Mua">Yêu cầu mua</option>
                            <option value="Trao đổi">Yêu cầu trao đổi</option>
                        </select>
                    </form>

                </div>
            </div>
        </div>
        <div class="" id="">
            <div class="card text-white bg-white mb-3" ng-controller="sliders">
                <table class="table" id="t1">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Tên sách</th>
                            <th scope="col">Comment</th>
                            <th scope="col">Ngày giao dịch</th>
                            <th scope="col">Thao tác</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>@mdo</td>
                            <td>Otto</td>
                            <td><button>Duyệt</button><button disabled>Đã duyệt</button></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Mark</td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td><button>Duyệt</button><button disabled>Đã duyệt</button></span>
                            </td>
                        </tr>
                    </tbody>
                    
                </table>
                <nav aria-label="Page navigation example" style="float: right">
                    <ul class="pagination" style="float: right;">
                      <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                  </nav>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>