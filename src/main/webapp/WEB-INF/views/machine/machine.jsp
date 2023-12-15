<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>설비 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Bootstrap CSS 및 JS 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
}
    </style>
</head>
<body>


<script>

	function openModal() {
    	document.getElementById("myModal").style.display = "block";
    	
	}

	function closeModal() {
    	document.getElementById("myModal").style.display = "none";
	}
	
	window.onclick = function(event) {
	    var modal = document.getElementById('myModal');
	    if (event.target == modal) {
	        closeModal();
	    }
	}

    
    function updateMachineCode() {
        var machineName = document.getElementById("machine_name").value;
        var machineCodeField = document.getElementById("machine_code");

        switch (machineName) {
            case "반죽":
                machineCodeField.value = "dough";
                break;
            case "토핑":
                machineCodeField.value = "topping";
                break;
        }
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
	    <td>member_name</td>
	    <td>purpose_of_use</td>
	    <td>purpos_of_check</td>
	    <td>last_check_time</td>
	    <td>last_operating_time</td>
	    <td>installation_date</td>
	    <td>machine_location</td>
        </tr>
        
 <%--        <c:forEach var="" items="">
		     <tr>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			    <td></td>
			  </tr>
		  </c:forEach> --%>
        
    </table>
    
    <form method="post">
    
    <input type="submit" value="post">
    
    </form>

    <button onclick="openModal()">설비 추가</button>
    <input type="button" value="설비 삭제">
</fieldset>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <form id="myForm" method="post">
           <table border="1">
                   <tr>
                   <th>설치 장비</th>
                   <th>설비 코드</th>
                   <th>작업자</th>
                   <th>설비 설치일</th>
                   <th>설비 위치</th>
                   </tr>
                   <tr>
                 	<td>
                 	<select id="machine_name" name="machine_name" onchange="updateMachineCode()" required>
                 	<option value="선택">--선택하세요--</option>
                 	<option value="반죽">반죽</option>
                 	<option value="토핑">토핑</option>
                 	<option value="오븐">오븐</option>
                 	<option value="포장">포장</option>
                 	</select>
                 	</td>
                 	<td>
                 <input type="text" id="machine_code" name="machine_code" readonly>
                   </td>
                    <td>
                   <input type="text" id="member_name" name="member_name" required>
                    </td>
                    <td>
                    <!-- <input type="text" id="installation_date" name="installation_date"> -->
                    </td>
                    <td> 
                    <select id="machine_location" name="machine_location">
                    <option value="선택">--선택하세요--</option>
                 	<option value="A">A</option>
                 	<option value="B">B</option>
                 	<option value="C">C</option>
                 	<option value="D">D</option>
                 	</select>
                 	</td>
                 	</tr>
                   </table>

            <input type="submit" value="등록">
            <input type="button" onclick="closeModal()" value="취소">
        </form>
    </div>
</div>



</body>
</html>