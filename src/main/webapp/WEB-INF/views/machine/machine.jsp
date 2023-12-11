<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>설비 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Bootstrap CSS 및 JS 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

<script>
    function openAddEquipmentModal() {
        $('#addEquipmentModal').modal('show');
    }
    
    function closeAddEquipmentModal() {
        $('#addEquipmentModal').modal('hide');
    }
</script>








<h1>설비 관리</h1>

<fieldset>
    <legend>설비 관리</legend>
    <table border="1">
        <!-- 테이블 헤더 -->
        <tr>
            <th>  </th>
	<th>설비 코드</th>
	<th>설비 이름</th>
	<th>설비 상태</th>
	<th>작업자</th>
	<th>작동 목적</th>
	<th>점검 목적</th>
	<th>마지막 점검일</th>
	<th>마지막 작동시간</th>
	<th>설비 설치일</th>
	<th>설비 위치</th>
        </tr>
       <td><input type="checkbox"></td>
	    <td>첫번째 칸</td>
	    <td>두번째 칸</td>
	    <td>세번째 칸</td>
	    <td>네번째 칸</td>
	    <td>다섯번째 칸</td>
	    <td>여섯번째 칸</td>
	    <td>일곱번째 칸</td>
	    <td>여덜번째 칸</td>
	    <td>아홉번째 칸</td>
	    <td>열번째 칸</td>
        <tr>
        <td><input type="checkbox"></td>
	    <td>machine_code</td>
	    <td>machine_name</td>
	    <td>machine_status</td>
	    <td>member_no</td>
	    <td>purpose_of_use</td>
	    <td>purpos_of_check</td>
	    <td>last_check_time</td>
	    <td>last_operating_time</td>
	    <td>installation_date</td>
	    <td>machine_location</td>

        </tr>
    </table>

    <button id="addEquipmentBtn" onclick="openAddEquipmentModal()">설비 추가</button>
    <input type="button" value="설비 삭제">
</fieldset>

<!-- 모달 내용 -->
<div id="addEquipmentModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">설비 추가</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
                <form id="addEquipmentForm" action="" method="post">
                   
                 	설비 코드 : <input type="text" id="machine_code" name="machine_code" required><br>
                    설비 이름 : <input type="text" id="" name=""><br>
                    설비 상태 : <input type="text" id="" name=""><br>
                    작업자 : <input type="text" id="" name=""><br>
                    작동 목적 : <input type="text" id="" name=""><br>
                    점검 목적 : <input type="text" id="" name=""><br>
                    마지막 점검일 : <input type="text" id="" name=""><br>
                    마지막 작동시간 : <input type="text" id="" name=""><br>
                    설비 설치일 : <input type="text" id="" name=""><br>
                    설비 위치 : <input type="text" id="" name=""><br>
                    <button type="submit">추가</button>
                    <button type="button" onclick="closeAddEquipmentModal()">취소</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>