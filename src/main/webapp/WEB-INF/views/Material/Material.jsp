<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="${path}/resources/img/logo.png">
    <title>자재 관리 시스템</title>

    <!-- External CSS and Fonts -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
    <link href="${path}/resources/css/nucleo-icons.css" rel="stylesheet" />
    <link href="${path}/resources/css/nucleo-svg.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <link id="pagestyle" href="${path}/resources/css/main.css" rel="stylesheet" />

    <!-- Custom CSS for Material Management -->
    <link href="path_to_your_css_file.css" rel="stylesheet" />

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-200 sb-nav-fixed">
    <main class="main-content mt-0">
        <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
            <span class="mask bg-gradient-dark opacity-6"></span>
            <div class="container my-auto">
                <div class="row">
                    <div class="col-lg-4 col-md-8 col-12 mx-auto">
                        <div class="card z-index-0 fadeIn3 fadeInBottom">
                            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                                    <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">자재 관리 시스템</h4>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="container-fluid px-4">
    <h1 class="mt-4">원자재 재고</h1>
    <div class="bnt">
        <!-- 버튼들: 수정, 저장, 취소 -->
        <input type="button" class="tableBtn" id="update" value="수정">
        <input type="button" class="tableBtn" id="save" value="저장">
        <input type="button" class="tableBtn" id="cancel" value="취소">
    </div>
    
    <div class="card mb-4" id="card mb-4">
        <div class="card-header">
            <!-- 검색 기능 -->
            <div class="cardHeaderFirstLine">
                <select id="category">
                    <option value="stock_code">코드</option>
                    <option value="raw_name">품명</option>
                    <option value="raw_type">종류</option>
                    <option value="wh_code">창고</option>
                </select>
                <input type="text" name="content" size="60" placeholder="검색어를 입력하세요" id="content">
                <input type="button" name="search" value="조회" onclick="stockSearch()">
                <input type="button" name="allList" value="전체목록" onclick="location.reload();">
            </div>             
        </div>  
        <div class="card-body">
            <!-- 테이블 뷰 -->
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th><input type="checkbox" name="selectedAll" disabled></th>
                        <th>코드</th>
                        <th>원자재 이름</th>
                        <th>종류</th>
                        <th>수량</th>
                        <th>실수량</th>
                        <th>창고 코드</th>
                        <th>담당자</th>
                        <th>확인 날짜</th>
                    </tr>
                </thead>
                <tbody id="tableBody">
                    <!-- 여기에 동적으로 행이 추가될 것입니다. -->
                </tbody>
            </table>
        </div>
    </div>
</div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer position-absolute bottom-2 py-2 w-100">
        <div class="container">
            <div class="row align-items-center justify-content-lg-between">
                <div class="col-12 col-md-6 my-auto">
                    <div class="copyright text-center text-sm text-white text-lg-start">
                        © <script>document.write(new Date().getFullYear())</script>,
                        <a href="${path }/" class="font-weight-bold text-white">Your Company Name</a>
                        <i class="fa fa-heart" aria-hidden="true"></i>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Core JS Files -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="path_to_your_javascript_file.js"></script>
</body>
</html>
