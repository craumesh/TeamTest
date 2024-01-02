<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="${path}/resources/img/logo.png">
    <title>자재 관리 시스템 - 입고</title>

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

	<!-- Core JS Files -->
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="path_to_your_javascript_file.js"></script>

    <link id="pagestyle" href="${path}/resources/css/main.css" rel="stylesheet" />
</head>
<body class="bg-gray-200 sb-nav-fixed">
    <main class="main-content mt-0">
        <!-- Page content -->
        <div class="container-fluid px-4">
            <h1 class="mt-4">원자재 재고 입고</h1>
            <div class="card mb-4">
                <div class="card-header">
                    <!-- 검색 기능 -->
                    <div class="cardHeaderFirstLine">
                        <select id="category">
                            <option value="stock_code">코드</option>
                            <option value="raw_name">품명</option>
                            <!-- 기타 옵션 -->
                        </select>
                        <input type="text" name="content" size="60" placeholder="검색어를 입력하세요" id="content">
                        <input type="button" name="search" value="조회" onclick="stockSearch()">
                        <input type="button" name="allList" value="전체목록" onclick="location.reload();">
                        <button id="exportBtn" class="btn btn-warning">자재 출고</button>
						</div>
                        <!-- 기타 버튼 -->
                    </div>             
                </div>  
                <div class="card-body">
                    <!-- 테이블 뷰 -->
                    <div class="card-body">
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
                            <script type="text/javascript">
    // 서버에서 데이터를 가져와 테이블에 삽입하는 함수
    function fetchData() {
        $.ajax({
            url: 'your-server-endpoint', // 데이터를 가져올 서버의 URL
            method: 'GET', // 데이터를 가져오는 방식
            dataType: 'json', // 받아올 데이터 형식
            success: function(data) {
                // 데이터를 성공적으로 받아왔을 때의 로직
                var tbody = document.getElementById('tableBody'); // 테이블 body 선택
                tbody.innerHTML = ''; // 초기화
                
                // 받아온 데이터로 행을 만들어 테이블에 삽입
                data.forEach(function(rowData) {
                    var row = `<tr>
                        <td><input type="checkbox" name="selectedRow"></td>
                        <td>${rowData.code}</td>
                        <td>${rowData.rawName}</td>
                        <td>${rowData.type}</td>
                        <td>${rowData.quantity}</td>
                        <td>${rowData.actualQuantity}</td>
                        <td>${rowData.warehouseCode}</td>
                        <td>${rowData.manager}</td>
                        <td>${rowData.confirmDate}</td>
                    </tr>`; // 각 행의 HTML 문자열

                    tbody.innerHTML += row; // 행을 tbody에 추가
                });
            },
            error: function(err) {
                // 데이터를 받아오는 데 실패했을 때의 로직
                console.error('Error fetching data: ', err);
            }
        });
    }

    // 페이지 로드 시 데이터를 가져옴
    document.addEventListener('DOMContentLoaded', function() {
        fetchData();
    });

    // 출고 기능 스크립트
    document.getElementById('exportBtn').addEventListener('click', function() {
        // TODO: 출고 관련 코드
        alert("출고 버튼이 클릭되었습니다. 출고 처리 로직을 여기에 구현하세요.");
        // 예: 선택된 자재 데이터 수집, 출고 수량 입력 요청, 서버에 출고 요청 등
    });
</script>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <footer class="footer position-absolute bottom-2 py-2 w-100">
        <!-- Footer -->
    </footer>

    <!-- Core JS Files -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>


</body>
</html>
