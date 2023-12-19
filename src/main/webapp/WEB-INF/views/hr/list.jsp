<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<!-- 본문 시작 -->
<style>
#member_info {
	margin-top: 50px;
}
</style>

<div>
	<div>
		<h3>인사 정보 테이블</h3>
	</div>

	<div id="Modal" class="modal">
		<div class="modal-content">
			<button class="btn-close position-absolute end-3"></button>
			<div id="member_info">
				<img alt="회원사진" id="photo_paths"><br>
				사번 <label id="employee_no"></label><br>
				아이디 <label id="id"></label><br>
				이름 <label id="name"></label><br>
				부서 <label id="depart_name"></label><br>
				직책 <label id="position_name"></label><br>
				이메일 <label id="email"></label><br>
				내선번호 <label id="extension_no"></label><br>
				연락처 <label id="contact"></label><br>
				주소 <label id="address"></label><br>
			</div>
		</div>
	</div>

	<div>
		<div class="col-sm-12">
			<table class="table table-bordered table-hover dataTable" role="grid">
				<thead>
					<tr class="table-dark" role="row">
						<th rowspan="1" colspan="1">사원번호</th>
						<th rowspan="1" colspan="1">이름</th>
						<th rowspan="1" colspan="1">이메일</th>
						<th rowspan="1" colspan="1">연락처</th>
						<th rowspan="1" colspan="1">재직상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr class="memList" role="row">
							<td>${vo.employee_no}</td>
							<td>${vo.name}</td>
							<td>${vo.email}</td>
							<td>${vo.contact}</td>
							<td>${vo.status}</td>
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
<!-- 본문 종료 -->
<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>

<script>
	var modal = document.getElementById("Modal");
	var span = document.getElementsByClassName("btn-close")[0];

	$(document).ready(function() {
		$("table").on("click", "tr", function() {
			var value = $(this).find("td:first").text();
			$.ajax({
				url : '/hr/content?employee_no='+value,
				method : 'GET',
				dataType: 'json',
				success : function(data) {
					$("#employee_no").text(data.employee_no);
				    $("#name").text(data.name);
				    $("#email").text(data.email);
				    $("#contact").text(data.contact);
				    $("#status").text(data.status);
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