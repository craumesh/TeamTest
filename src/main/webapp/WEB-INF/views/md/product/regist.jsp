<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../include/js.jsp"%>
<head>
<meta charset="UTF-8">
 <link rel="icon" type="image/png" href="${path}/resources/img/logo.png">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <link href="/resources/css/nucleo-icons.css" rel="stylesheet" />
  <link href="/resources/css/nucleo-svg.css" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <link id="pagestyle" href="/resources/css/main.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="g-sidenav-show  bg-gray-200">
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
<div class="card my-4">
	<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
		<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
			<h3 class="text-white text-capitalize ps-5">품목 등록</h3>
		</div>
	</div>	
	<div class="card-body px-0 pb-2">
		<div class="card-body">
			<!-- 폼테그 시작  -->
			<form id="product_reg_form" method="post">
				<!-- 거래처 정보 -->
				<div class="row mb-4">
					<div class="card">
						<div class="card-header py-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h6>거래처</h6>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7 ps-3">거래처 명</th>
											<th class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7 ps-3">담당자 명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="d-flex px-2 py-1">
													<div class="input-group input-group-dynamic d-flex flex-column justify-content-center">
														<select class="form-control" id="company_name">
															<c:forEach var="list" items="${list }">
																<option value="${list.company_no }">${list.company_name }</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</td>
											<td>
												<div class="d-flex px-2 py-1">
													<div class="d-flex flex-column justify-content-center">
														<h6 id="company_manager" class="mb-0 text-sm"></h6>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 창고 정보 -->
				<div class="row mb-4">
					<div class="card">
						<div class="card-header pb-0">
							<div class="row">
								<div class="col-lg-6 col-7">
									<h6>품목정보 입력</h6>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive mx-3">
								<div class="m-3 d-flex justify-content-center">
									<img class="max-width-200 img-thumbnail" id="preview-image" alt="품목 이미지 " src="/resources/img/productimg.png">
								</div>
								<div class="d-flex justify-content-center">
									<label class="btn btn-primary" for="file-input">사진 업로드</label>
									<input id="file-input" class="d-none" type="file" name="photo_paths" accept="image/*">						
								</div>
								<table class="table align-items-center mt-4 mb-0">
									<tbody>
										<tr>
											<td class="align-middle text-center col-2">
												<label class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7">대분류</label>
												<div class="input-group input-group-dynamic mb-4">
													<select class="form-control text-center" name="category" id="choices-button">
													  <option value="자재" selected>자재</option>
													  <option value="완제품" >완제품</option>
													</select>
												</div>
											</td>
											<td class="align-middle text-center col-2">
												<label class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7">소분류</label>
												<div class="input-group input-group-dynamic mb-4">
													<input type="text" name="category_detail" class="form-control">
												</div>
											</td>
											<td class="align-middle text-center col-2">
												<label class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7">기준단위</label>
												<div class="input-group input-group-dynamic mb-4">
													<select class="form-control text-center" name="unit" id="choices-button">
													  <option value="g" selected>g</option>
													  <option value="ea" >ea</option>
													</select>
												</div>
											</td>
											<td class="align-middle text-center col-2">
												<label class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7">단위단가</label>
												<div class="input-group input-group-dynamic mb-4">
													<input type="text" name="price" class="form-control" onkeypress="return onlyNumbersAndDot(event);">
												</div>
											</td>																						
											<td class="align-middle text-center">
												<label class="text-uppercase text-uppercase text-secondary font-weight-bolder opacity-7">상품명</label>
												<div class="input-group input-group-dynamic mb-4">
													<input type="text" name="name" class="form-control">
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- 등록 버튼 -->
				<div class="text-center">
					<button type="button" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" onclick="registAlert()">등록하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../../include/footer.jsp"%>
<script>
$(document).ready(function() {
    $('#file-input').on('change', function() {
      previewImage(this);
    });
});

function registAlert(){
	swal({
		  title: "정말 등록 하시겠습니까?",
		  text: "이걸요?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			swal("등록은 해드리겠는데...", {icon: "success"}).then(function(){
				$("#product_reg_form").submit();     
			});							
		  } else {
		    swal("잘 생각하셨어요!");
		  }
	});	
}

function previewImage(input) {
    var preview = $('#preview-image')[0];
    var file = input.files[0];

    if (file) {
      var reader = new FileReader();

      reader.onload = function(event) {
        preview.src = event.target.result;
      };

      reader.readAsDataURL(file);
    }
}

// 가격 입력 방식 제한(숫자와 한개의 .만 허용)
function onlyNumbersAndDot(event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    var input = event.target.value;
    
    if ((charCode >= 48 && charCode <= 57) || charCode === 46) {
        if (input.indexOf('.') !== -1 || input === "") {
            return charCode !== 46;
        }
        return true;
    }

    return false;
}
</script>
<script src="/resources/js/plugins/warehouseMain.js"></script>