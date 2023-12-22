<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="icon" type="image/png" href="${path}/resources/img/logo.png">
  <title>
    	품목정보관리
  </title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <link href="${path}/resources/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/resources/css/nucleo-svg.css" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <link id="pagestyle" href="${path}/resources/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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

<body class="g-sidenav-show  bg-gray-200">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="${path}/main">
        <span class="ms-1 font-weight-bold text-white">디저트카페 EatIt</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav" id="mn">
        <li class="nav-item">
          <a class="nav-link text-white active bg-gradient-primary" href="/">
            <span class="nav-link-text ms-1">메인</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white">
          	<span class="nav-link-text ms-1">기준정보 관리</span>
          </a>
          <!-- 기준정보 관리 서브메뉴 -->
		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/masterdata/BomMain">
		        <span class="nav-link-text ms-1">BOM관리</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
		</li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">자재 관리</span>
          </a>
          
  		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">설비&생산 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">창고 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">납품 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ">
            <span class="nav-link-text ms-1">인사 관리</span>
          </a>
          		  <ul class="navbar-nav" id="sm">
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu1.html">
		        <span class="nav-link-text ms-1">서브메뉴 1</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu2.html">
		        <span class="nav-link-text ms-1">서브메뉴 2</span>
		      </a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-white" href="${path}/submenu3.html">
		        <span class="nav-link-text ms-1">서브메뉴 3</span>
		      </a>
		    </li>
		  </ul>
        </li>
      </ul>
    </div>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
  
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <h6 class="font-weight-bolder mb-0">BOM관리메인</h6>
        </nav>
        
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
          </div>
          
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="<%= request.getContextPath() %>pages/sign-in.html" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Login</span>
              </a>
            </li>
          </ul>
        </div>       
      </div>
      
    </nav>
    <!-- End Navbar -->
    
    
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
                   <td><button onclick="openEditModal(event)" class="btn btn-warning">품목정보수정</button></td>
                   <td><button type="submit" class="btn btn-danger">품목정보삭제</button></td>
                </tr>
            </c:forEach>
        </tbody>
    
      
    </table>
    
    <button onclick="openModal()">품목정보등록</button>
   
    
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
        <form id="editForm" method="post" action="/masterdata/PIMedit">
            <table>
             <tr>                   
                    <td><input type="hidden" name="product_no" value="product_no"></td>
                </tr>
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
    function deleteProduct(productNo) {
        if (confirm('품목 정보를 삭제하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '/masterdata/delete',
                data: { product_no: productNo },
                success: function(response) {
                    // 삭제에 대한 처리 - 성공 시 행 삭제
                    if (response.success) {
                        // 여기에서 해당 행을 삭제하도록 코드 작성
                        alert('품목 정보가 삭제되었습니다.');
                    } else {
                        alert('삭제 실패: ' + response.message);
                    }
                },
                error: function() {
                    alert('서버 오류: 삭제에 실패했습니다.');
                }
            });
        }
    }
</script>





   <script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
        
    }

   
    function openEditModal(event) {
        // 수정 버튼이 속한 <tr> 요소를 찾습니다.
        const selectedRow = event.target.closest('tr');

        // 각 셀의 데이터를 가져와 변수에 저장합니다.
        const productNo = selectedRow.cells[0].innerText;
        const productCode = selectedRow.cells[1].innerText;
        const productName = selectedRow.cells[2].innerText;
        const productCategory = selectedRow.cells[3].innerText;
        const companyNo = selectedRow.cells[4].innerText;
        const productUnit = selectedRow.cells[5].innerText;
        const productPrice = selectedRow.cells[6].innerText;
        const recipe = selectedRow.cells[7].innerText;

        // 가져온 데이터를 수정 모달에 넣어줍니다.
        document.getElementById("editModal").style.display = "block";
        document.querySelector('#editForm [name="product_no"]').value = productNo;
        document.querySelector('#editForm [name="product_code"]').value = productCode;
        document.querySelector('#editForm [name="product_name"]').value = productName;
        document.querySelector('#editForm [name="product_category"]').value = productCategory;
        document.querySelector('#editForm [name="company_no"]').value = companyNo;
        document.querySelector('#editForm [name="product_unit"]').value = productUnit;
        document.querySelector('#editForm [name="product_price"]').value = productPrice;
        document.querySelector('#editForm [name="recipe"]').value = recipe;
        
       
        
    }
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
        
    }
    function validateForm(formId) {
        const form = document.getElementById(formId);
        const inputs = form.getElementsByTagName('input');

        for (let i = 0; i < inputs.length; i++) {
            if (inputs[i].value.trim() === '') {
                
                return false;
            }
        }
        return true;
    }

    document.getElementById('myForm').addEventListener('submit', function (event) {
    	 event.preventDefault(); // 기본 제출 동작 방지

 	    if (!validateForm('myForm')) {
 	        // 폼이 유효하지 않은 경우
 	        swal('입력하지 않은 칸이 있습니다!', '', 'warning');
 	        return;
 	    }

 	    // 유효한 경우 SweetAlert로 사용자에게 확인 요청
 	    swal({
 	        title: '품목정보 등록',
 	        text: '정말 등록하시겠습니까? 한 번 더 정보를 확인해 주세요',
 	        icon: 'info',
 	        buttons: true,
 	        dangerMode: false,
 	    })
 	    .then((willSubmit) => {
 	        if (willSubmit) {
 	            swal('등록이 성공적으로 완료됐습니다!', '', 'success')
 	            .then(() => {
 	                event.target.submit(); // 확인을 누르면 submit 실행
 	            });
 	        } else {
 	            swal('등록 취소', '등록이 취소되었습니다.', 'info');
 	        }
 	    });
    });

    document.getElementById('editForm').addEventListener('submit', function (event) {
    	 event.preventDefault(); // 기본 제출 동작 방지

    	    if (!validateForm('editForm')) {
    	        // 폼이 유효하지 않은 경우
    	        swal('입력하지 않은 칸이 있습니다!', '', 'warning');
    	        return;
    	    }

    	    // 유효한 경우 SweetAlert로 사용자에게 확인 요청
    	    swal({
    	        title: '품목정보 수정',
    	        text: '정말 수정하시겠습니까? 한 번 더 정보를 확인해 주세요',
    	        icon: 'info',
    	        buttons: true,
    	        dangerMode: false,
    	    })
    	    .then((willSubmit) => {
    	        if (willSubmit) {
    	            swal('수정이 성공적으로 완료됐습니다!', '', 'success')
    	            .then(() => {
    	                event.target.submit(); // 확인을 누르면 submit 실행
    	            });
    	        } else {
    	            swal('수정 취소', '수정이 취소되었습니다.', 'info');
    	        }
    	    });
    });
   
    
    
</script>
      <footer class="footer py-4  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
               	 항상 여러분 곁에는
                <a href="${path}/main" class="font-weight-bold">EatIt</a>
                 <i class="fa fa-heart"></i> 
                                           이 함께합니다.
              </div>
            </div>
          </div>
        </div>
      </footer>
    
  </main>
  <!--   Core JS Files   -->
  <script src="${path}/resources/js/core/popper.min.js"></script>
  <script src="${path}/resources/js/core/bootstrap.min.js"></script>
  <script src="${path}/resources/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/resources/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${path}/resources/js/plugins/jquery.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/smooth-scrollbar"></script>

 
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  
	<script>
	$(document).ready(function () {
	  $("#sm").hide();
	
	  $("ul#mn > li").mouseenter(function () {
	    $("#sm").stop().hide(); // 다른 메뉴 항목에 대한 서브메뉴 감추기
	    $(this).find("#sm").show().css({ height: "0px" }).animate({ height: "125px" });
	  });
	
	  // 마우스가 메뉴 항목에서 벗어날 때 서브메뉴 감추기
	  $("ul#mn > li").mouseleave(function () {
	    $(this).find("#sm").stop().hide();
	  });
	});
	</script>
</body>
</html>