<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp" %>
<!-- Bootstrap CSS 및 JS 추가 -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<style>
/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	width: 50%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	position: absolute;
	right: 20px;
	top: 20px;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
}
#machine_info {
	margin-top: 50px;
}
</style>

<div class="col-10 m-auto">
<div class="card">
<div class="card-header p-0 position-relative mx-3 z-index-2">
	<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">
				<h3 class="text-white text-capitalize ps-5 align-items-center mb-0 py-1">설비 관리</h3>
				<div class="ms-md-auto bg-white rounded p-2 d-flex align-items-center">
					<div class="align-items-center d-flex flex-column">
						<div class="input-group input-group-outline">
							<label class="form-label">검색어</label>
							<input type="text" id="searchWord" name="searchWord" class="form-control">
						</div>
					</div>
					<div class="align-items-center d-flex flex-column py-1">
						<button id="searchbtn" class="btn btn-outline-primary btn-sm mb-0 py-1 ms-2">검색</button>
					</div>
				</div>
			</div>
		</div>

		<table class="table">
			<!-- 테이블 헤더 -->
			<tr>
				<th></th>
				<th>설비 코드</th>
				<th>설비 상태</th>
				<th>관리자</th>
				<th>작동 목적</th>
				<th>설비 설치일</th>
				<th>설비 위치</th>
			</tr>

			<c:forEach var="ml" items="${machinelist}">
				<tr>
					<td><input type="checkbox" id="${ml.machine_code}"></td>
					<td>${ml.machine_name}_${ml.machine_code}</td>
					<td>${ml.machine_status}</td>
					<td>${ml.member_no}</td>
					<td>${ml.purpose_of_use}</td>
					<td>${ml.installation_date}</td>
					<td>${ml.machine_location}</td>
				</tr>
			</c:forEach>

		</table>
		<div class="col-6 w-100 text-end">
		<a class="btn bg-gradient-dark mb-0" onclick="openModal()"><i class="material-icons text-sm"></i>&nbsp;&nbsp;설비 추가</a>
		<a class="btn bg-gradient-dark mb-0" onclick=""><i class="material-icons text-sm"></i>&nbsp;&nbsp;설비 삭제</a>
		</div>
</div>
</div>


	<div id="myModal" class="modal position-absolute">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<form id="myForm" method="post">
				<table border="1">
					<tr>
						<th>설치 장비</th>
						<th>작업자</th>
						<th>설비 설치일</th>
						<th>설비 위치</th>
					</tr>
					<tr>
						<td><select id="machine_name" name="machine_name" onchange="updateMachineCode()" required>
								<option value="선택">--선택하세요--</option>
								<option value="Dough">반죽</option>
								<option value="Topping">토핑</option>
								<option value="Oven">오븐</option>
								<option value="Packaging">포장</option>
							</select></td>
						<td><input type="text" id="member_no" name="member_no" required>
							<input type="hidden" id="machine_code" name="machine_code" value="${code }">
						</td>
						<td><input type="text" id="installation_date" name="installation_date"></td>
						<td><select id="machine_location" name="machine_location">
								<option value="선택">--선택하세요--</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="D">D</option>
						</select></td>
					</tr>
				</table>

				<input type="submit" value="등록"> <input type="button" onclick="closeModal()" value="취소">
			</form>
		</div>
	</div>


	<!-- 설비 상세보기 -->
	<div id="Modal" class="modal">
		<div class="modal-content">
			<button class="btn-close position-absolute end-3"></button>
			<div id="machine_info">
			<form action="">
            설비 코드 : <input type="text" id="namecode" readonly><br>
            설비 상태 : <select id="status" >
								<option value="선택">--선택하세요--</option>
								<option value="점검중">점검중</option>
								<option value="수리중">수리중</option>
								<option value="고장">고장</option>
								<option value="설치중">설치중</option>
						</select><br>
			 작 업 자 :  <input type="text" id="memberno" readonly><br>
			 마지막 점검일 : <input type="text" id="lastchecktime"  readonly><br>
			 마지막 작동시간 : <input type="text" id="lastoperatingtime"  readonly><br>
			 설비 설치일 : <input type="text" id="installationdate"  readonly><br>
			 설비 위치 : <input type="text" id="machinelocation"  readonly><br>
			 
			
            <input type="submit" value="저장"> <input type="button" onclick="closeModal()" value="닫기">
        </form>
 			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/js.jsp" %>
<script>

$(document).ready(function () {
    $("table").on("click", "tr", function () {
        // 추출한 machine_code
        var machineCode = $(this).find("td:eq(1)").text().match(/\d+/);

        $.ajax({
            url: '/machine/machineinfo?machine_code=' + machineCode, 
            method: 'GET',
            data: { machineCode: machineCode ? parseInt(machineCode[0]) : 0 },
            dataType: 'json',
            success: function (data) {
                // infolist의 각 항목을 순회
                for (var i = 0; i < data.infolist.length; i++) {
                    var historyData = data.infolist[i];
                }
                
                // 서버에서 받은 데이터를 사용하여 모달에 표시
                var namecode = data.machine_name + "_" + historyData.machine_code;
                $("#namecode").val(namecode);
                $("#code").val(historyData.machine_code);
                $("#name").val(data.machine_name);
                $("#status").val(data.machine_status);
                $("#memberno").val(data.member_no);
                // formatDate 함수를 AJAX 내부에 직접 정의
                function formatDate(dateString) {
                    var formattedDate = dateString.replace(/(\d+)월 (\d+), (\d+)/, '$3-$1-$2');
                    return formattedDate;
                }
                // formatDate 함수를 사용하여 날짜 형식 변환
                $("#lastchecktime").val(formatDate(historyData.check_time));
                $("#lastoperatingtime").val(formatDate(historyData.operating_time));
                $("#installationdate").val(formatDate(data.installation_date));
                $("#machinelocation").val(data.machine_location);

                // 모달 열기
                document.getElementById("Modal").style.display = "block";
            },
            error: function (error) {
                console.log('실패:', error);
            }
        });
    });
});
	

		function openModal() {
			document.getElementById("myModal").style.display = "block";
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0');
			var yyyy = today.getFullYear();
			today = yyyy + '-' + mm + '-' + dd;
			document.getElementById("installation_date").value = today;
		}

		function closeModal() {
			document.getElementById("myModal").style.display = "none";
			document.getElementById("MachinModal").style.display = "none";
			
			location.reload();
		}

		window.onclick = function(event) {
			var modal = document.getElementById('myModal');
			var modal2 = document.getElementById('MachinModal');
			if (event.target == modal) {
				closeModal();
			}
			if (event.target == modal2) {
				closeModal();
			}
		}
		

		    
		
		
		
	</script>

</html>