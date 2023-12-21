<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<!-- 본문 시작 -->
<div class="col-11 mx-auto">
	<div class="card my-3 mx-auto pt-5 px-6 pb-4">
		<div class="card-header p-0 position-relative mb-2 mx-3 z-index-2">
			<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">
				<h3 class="text-white text-capitalize ps-5 align-items-center mb-0 py-1">인사 정보 테이블</h3>
				<div class="ms-md-auto bg-white rounded p-2 d-flex align-items-center">
					<div class="align-items-center d-flex flex-column">
						<div class="input-group input-group-outline">
							<label class="form-label">검색어</label>
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="align-items-center d-flex flex-column py-1">
						<a class="btn btn-outline-primary btn-sm mb-0 py-1 ms-2" target="_blank" href="">검색</a>
					</div>
				</div>
			</div>
		</div>		
	
		<div class="card-body mx-5 px-0 pb-4">
			<div class="table-responsive p-0">
				<table class="table table-hover align-items-center mb-0">
					<thead>
						<tr>
							<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><input type="checkbox"></th>
							<th class="text-center font-weight-bolder col-2">사원번호</th>
							<th class="text-center font-weight-bolder col-1">이름</th>
							<th class="text-center font-weight-bolder col-1">직책</th>
							<th class="text-center font-weight-bolder col-4">이메일</th>
							<th class="text-center font-weight-bolder col-3">내선번호</th>
							<th class="text-center font-weight-bolder col-3">연락처</th>
							<th class="text-center font-weight-bolder col-1">재직상태</th>
						</tr>
					</thead>
	 				<tbody>
						<c:forEach var="vo" items="${list}">
							<tr class="memList">
								<td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 py-3"><input type="checkbox"></td>
								<td class="text-center identify-no">${vo.employee_no}</td>
								<td class="text-center">${vo.name}</td>
								<td class="text-center">${vo.position_name}</td>
								<td class="text-center">${vo.email}</td>
								<td class="text-center">${vo.extension_no}</td>
								<td class="text-center">${vo.contact}</td>
								<td class="text-center"><span class="badge badge-sm bg-gradient-success">${vo.status}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div>Showing 1 to 10 of 57 entries</div>
			</div>
			<div class="col-sm-5">
				<ul class="pagination">
					<li class="page-link link-container"><a href="#" class="link"><<</a></li>
					<li class="page-link link-container"><a href="#" class="link">1</a></li>
					<li class="page-link link-container"><a href="#" class="link">2</a></li>
					<li class="page-link link-container"><a href="#" class="link">>></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 본문 종료 -->

<div id="Modal" class="modal top-10 position-absolute">
	<div class="modal-dialog">
		<div class="modal-content">
			<button class="btn-close position-absolute end-5"></button>
			<div class="modal-header">
				<h3 class="modal-title mx-auto">사원 정보</h3>
			</div>
			<div class="modal-body p-5">
				<div class="user-container d-flex align-items-center">
					<img class="img-thumbnail mb-4 me-4 max-width-200 w-30" alt="회원사진" id="photo_paths">
					<div class="user-info d-flex w-100">
						<table class="table">
							<tr>
								<th class="fs-5">사번</th>
								<td class="fs-5" id="employee_no"></td>
							</tr>
							<tr>
								<th class="fs-5">이름</th>
								<td class="fs-5" id="name"></td>
							</tr>
							<tr>
								<th class="fs-5">아이디</th>
								<td class="fs-5" id="id"></td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<table class="table">
						<tr>
							<th class="fs-5">부서</th>
							<td class="fs-5" id="depart_name"></td>
						</tr>
						<tr>
							<th class="fs-5">직책</th>
							<td class="fs-5" id="position_name"></td>
						</tr>
						<tr>
							<th class="fs-5">이메일</th>
							<td class="fs-5" id="email"></td>
						</tr>
						<tr>
							<th class="fs-5">내선번호</th>
							<td class="fs-5" id="extension_no"></td>
						</tr>
						<tr>
							<th class="fs-5">연락처</th>
							<td class="fs-5" id="contact"></td>
						</tr>
						<tr>
							<th class="fs-5">주소</th>
							<td class="fs-5" id="address"></td>
						</tr>
						<tr>
							<th class="fs-5">재직상태</th>
							<td class="fs-5" id="status"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>

<script>
	var modal = document.getElementById("Modal");
	var span = document.getElementsByClassName("btn-close")[0];

	$(document).ready(function() {
		$("table").on("click", "tr", function(event) {
            // 첫 번째 열과 행을 제외한 부분만 처리
			if (!$(event.target).is(':first-child') && !$(this).is(':first')) {
	            var value = $(this).find("td.identify-no").text();
				$.ajax({
					url : '/hr/content?employee_no='+value,
					method : 'GET',
					dataType: 'json',
					success : function(data) {
						$('#photo_paths').attr('src', data.photo_paths).attr('width', '100');
						$("#employee_no").text(data.employee_no);
						$("#id").text(data.id);
					    $("#name").text(data.name);
					    $("#depart_name").text(data.depart_name);
					    $("#position_name").text(data.position_name);
					    $("#email").text(data.email);
					    $("#extension_no").text(data.extension_no);
					    $("#contact").text(data.contact);
					    $("#address").text(data.address);
					    $("#status").text(data.status);
						modal.style.display = "block";
					},
					error : function(error) {
						console.log('실패:', error);
					}
				});
			}
	    });
		
		$(".btn-close").click(function(){
			modal.style.display = "none";
			location.reload();
		});
		
		$(window).click(function(event){
			if (event.target == modal) {
				modal.style.display = "none";
				location.reload();
			}
			
			if (!$(event.target).closest('.input-group').length) {
		        $(".input-group").removeClass("focused is-focused");
		    }
		});		
		
		$(".input-group").click(function(){
			$(this).addClass("focused is-focused");
		});
	});
	
</script>