<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목정보관리</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <style>
    /* 추가된 CSS */
    .form-horizontal .form-group {
        margin-bottom: 15px;
    }

    /* 수정된 모달 스타일 */
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
        width: 60%; /* 너비 조정 */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
     table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
    }

    /* 마지막 행의 버튼을 우측 정렬 */
    td:last-child {
        text-align: right;
    }
   .alert {
    padding: 20px;
    background-color: #f8d7da;
    color: #721c24;
    margin-bottom: 15px;
    border-radius: 5px;
    display: none;
    border: 1px solid #f5c6cb;
}

/* 닫기 버튼 스타일 */
.closebtn {
    margin-left: 15px;
    color: #721c24;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: #f44336;
}
</style>
</head>
<body>
 <table border="1">
        <thead>
            <tr>
                <th>품목정보번호</th>
                <th>품목코드</th>
                <th>품목이름</th>
                <th>품목카테고리</th>
                <th>거래처번호</th>
                <th>단위</th>
                <th>납품 단가</th>
                <th>레시피</th>
            </tr>
        </thead>
        <tbody>          
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.product_no}</td>
                    <td>${product.product_code}</td>
                    <td>${product.product_name}</td>
                    <td>${product.product_category}</td>
                    <td>${product.company_no}</td>
                    <td>${product.product_unit}</td>
                    <td>${product.product_price}</td>
                    <td>${product.recipe }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <button onclick="openModal()">품목정보등록</button>
    <button onclick="openEditModal()">품목정보수정</button>
    
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <form id="myForm" method="post">
            <table>
                <tr>
                    <td>품목코드:</td>
                    <td><input type="text" name="product_code"></td>
                </tr>
                <tr>
                    <td>품목이름:</td>
                    <td><input type="text" name="product_name"></td>
                </tr>
                <tr>
                    <td>품목카테고리:</td>
                    <td><input type="text" name="product_category"></td>
                </tr>
                <tr>
                    <td>거래처코드:</td>
                    <td><input type="text" name="company_no"></td>
                </tr>
                <tr>
                    <td>단위:</td>
                    <td><input type="text" name="product_unit"></td>
                </tr>
                <tr>
                    <td>납품단가:</td>
                    <td><input type="text" name="product_price"></td>
                </tr>
                <tr>
                    <td>레시피:</td>
                    <td><input type="text" name="recipe"></td>
                </tr>
                
                <tr>
                    <td colspan="2" style="text-align: right;">
                        <input type="submit" value="등록">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeEditModal()">&times;</span>
        <form id="editForm" method="post">
            <table>
            <tr>
                    <td>품목코드:</td>
                    <td><input type="text" name="product_code"></td>
                </tr>
                <tr>
                    <td>품목이름:</td>
                    <td><input type="text" name="product_name"></td>
                </tr>
                <tr>
                    <td>품목카테고리:</td>
                    <td><input type="text" name="product_category"></td>
                </tr>
                <tr>
                    <td>거래처코드:</td>
                    <td><input type="text" name="company_no"></td>
                </tr>
                <tr>
                    <td>단위:</td>
                    <td><input type="text" name="product_unit"></td>
                </tr>
                <tr>
                    <td>납품단가:</td>
                    <td><input type="text" name="product_price"></td>
                </tr>
                <tr>
                    <td>레시피:</td>
                    <td><input type="text" name="recipe"></td>
                </tr>
                
                <tr>
                    <td colspan="2" style="text-align: right;">
                        <input type="submit" value="수정">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

   <script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

   /*  function submitForm() {
        var form = document.getElementById("myForm");
        var formData = new FormData(form);
        console.log(formData);

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/masterdata/PIM", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 요청 성공 처리
                    closeModal(); // 성공 시 모달 닫기
                } else {
                    // 요청 실패 처리
                    alert('등록에 실패했습니다.');
                }
            }
        };
        xhr.send(formData);
    } */
    function openEditModal() {
        document.getElementById("editModal").style.display = "block";
    }

    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }
    function validateForm(formId) {
        const form = document.getElementById(formId);
        const inputs = form.getElementsByTagName('input');

        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value.trim() === '') {
                alert('입력하지 않은 칸이 있습니다!');
                return false;
            }
        }
        return true;
    }

    document.getElementById('myForm').addEventListener('submit', function (event) {
        if (!validateForm('myForm')) {
            event.preventDefault();
        }
    });

    document.getElementById('editForm').addEventListener('submit', function (event) {
        if (!validateForm('editForm')) {
            event.preventDefault();
        }
    });
</script>
  
</body>
</html>