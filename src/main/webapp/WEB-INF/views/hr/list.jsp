<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<!-- 본문 시작 -->
<div class="col-11 mx-auto">
	<div class="card my-3 mx-auto pt-5 px-6 pb-4">
		<div class="card-header p-0 position-relative mb-2 mx-3 z-index-2">
			<div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
				<h3 class="text-white text-capitalize ps-5">인사 정보 테이블</h3>
			</div>
		</div>		
	
		<div class="card-body mx-3 px-0 pb-4">
			<div class="table-responsive p-0">
				<table class="table table-bordered table-hover align-items-center mb-0">
					<thead>
						<tr>
							<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><input type="checkbox"></th>
							<th class="text-center font-weight-bolder col-3">사원번호</th>
							<th class="text-center font-weight-bolder col-3">이름</th>
							<th class="text-center font-weight-bolder col-7">이메일</th>
							<th class="text-center font-weight-bolder col-7">연락처</th>
							<th class="text-center font-weight-bolder col-3">재직상태</th>
						</tr>
					</thead>
	 				<tbody>
						<c:forEach var="vo" items="${list}">
							<tr class="memList">
								<td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 py-3"><input type="checkbox"></td>
								<td class="text-center identify-no">${vo.employee_no}</td>
								<td class="text-center">${vo.name}</td>
								<td class="text-center">${vo.email}</td>
								<td class="text-center">${vo.contact}</td>
								<td class="text-center">${vo.status}</td>
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

<div id="Modal" class="modal top-10">
	<div class="modal-dialog p-5">
		<div class="modal-content">
			<button class="btn-close position-absolute end-5"></button>
			<div class="modal-header">
				<h3 class="modal-title">사원 정보</h3>
			</div>
			<div class="modal-body">
				<div class="user-container" style="display: flex; align-items: center;">
					<img alt="회원사진" id="photo_paths" style="max-width: 100px;">
					<div class="user-info" style="display: flex; flex-direction: column;">
					<div class="inline" style="display: flex; align-items: center;">
					사번 <label id="employee_no" style="margin-top: 10px;"></label>
					</div>
					<div>
					이름 <label id="name"></label>
					</div>
					<div>
					아이디 <label id="id"></label>
					</div>
					</div>
				</div>
				<div>
					부서 <label id="depart_name"></label><br>
					직책 <label id="position_name"></label><br>
					이메일 <label id="email"></label><br>
					내선번호 <label id="extension_no"></label><br>
					연락처 <label id="contact"></label><br>
					주소 <label id="address"></label><br>
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
		$("table").on("click", "tr", function() {
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
				    $("#address").text(data.status);
					modal.style.display = "block";
				},
				error : function(error) {
					console.log('실패:', error);
				}
			});
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
		});
	});
</script>