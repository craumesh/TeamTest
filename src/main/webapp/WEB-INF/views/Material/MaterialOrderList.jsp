<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<!-- 본문 시작 -->
<div class="col-11 mx-auto">
	<div class="card my-3 mx-auto pt-5 px-6 pb-2">
		<div class="card-header p-0 position-relative mx-3 z-index-2">

			<div
				class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">
				<h3
					class="text-white text-capitalize ps-5 align-items-center mb-0 py-1">자재
					발주 내역</h3>
				<div
					class="ms-md-auto bg-white rounded p-2 d-flex align-items-center">
					<div class="align-items-center d-flex flex-column">
						<div class="input-group input-group-outline">
							<label class="form-label">검색어를 입력하세요</label> <input type="text"
								id="searchword" name="searchword" class="form-control"
								value="${param.searchword }">
						</div>
					</div>
					<div class="align-items-center d-flex flex-column py-1">
						<button id="searchbtn"
							class="btn btn-outline-primary btn-sm mb-0 py-1 ms-2"
							onclick="location.href='/Material/searchlist?pageType=MaterialOrderList'">검색</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 팝업  -->
		<div class="card-body px-0 pb-2">
			<div class="text-end pe-4 pb-3">
				<a class="btn bg-gradient-dark mb-0"
					onclick="popupMaterialwriteForm();"> <i
					class="material-icons text-sm">발주서작성하기</i>
				</a>
			</div>
			<div class="my-3 p-3 bg-white rounded shadow-sm">
				<h6 class="border-bottom border-gray pb-2 mb-0">발주 목록</h6>
				<div class="table-responsive p-0">
					<form role="form" method="post">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th
										class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">
										<input type="checkbox" id="cbx_chkAll">
									</th>
									<th scope="col" class="text-center font-weight-bolder col-2">발주
										번호</th>
									<th scope="col" class="text-center font-weight-bolder col-1">거래처정보번호</th>
									<th scope="col" class="text-center font-weight-bolder col-1">발주
										일자</th>
									<th scope="col" class="text-center font-weight-bolder col-3">자재
										코드</th>
									<th scope="col" class="text-center font-weight-bolder col-4">수량</th>
									<th scope="col" class="text-center font-weight-bolder col-3">발주자명</th>
									<th scope="col" class="text-center font-weight-bolder col-3">처리상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${MaterialOrderList}" var="Materialorder">
									<tr>
										<td
											class="text-uppercase text-secondary text-xxs font-weight-bold opacity-7"
											style="padding: 0.75rem 1.5rem;"><input type="checkbox"
											name="chk" value="${Materialorder.materialod_id}"></td>
										<td class="text-center identify-no">${Materialorder.materialod_id}</td>
										<td class="text-center">${Materialorder.company_no}</td>
										<td class="text-center">${Materialorder.materialod_date}</td>
										<td class="text-center">${Materialorder.product_no}</td>
										<td class="text-center">${Materialorder.quantity}</td>
										<td class="text-center">${Materialorder.employee_no}</td>
										<td class="text-center">${Materialorder.status}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					<!-- 페이징 부분 -->
					<div class="row">
						<div class="col-sm-5">
							<div class="ms-6">${pageVO.startPage }/${pageVO.endPage }of
								page</div>
						</div>
						<div class="col-sm-5 mb-3">
							<ul class="pagination">
								<c:if test="${pageVO.prev }">
									<li class="page-link link-container"><a
										href="/Material/${listUrl }?page=${pageVO.endPage-pageVO.displayPageNum }&filter=${filter}&searchword=${searchword}"
										class="link"><<</a></li>
								</c:if>
								<c:forEach var="i" begin="${pageVO.startPage }"
									end="${pageVO.endPage }" step="1">
									<li
										${pageVO.cri.page == i ? "class='link-container active'" : "class='link-container'"}>
										<a
										href="/Material/${listUrl }?page=${i }&filter=${filter}&searchword=${searchword}"
										${pageVO.cri.page == i ? "class='page-link rounded fw-bolder link-white'" : "class='page-link rounded fw-bolder'"}>${i }</a>
									</li>
								</c:forEach>
								<c:if test="${pageVO.next }">
									<li class="page-link link-container"><a
										href="/Material/${listUrl }?page=${pageVO.startPage+pageVO.displayPageNum }&filter=${filter}&searchword=${searchword}"
										class="link">>></a></li>
								</c:if>
							</ul>
						</div>
						<div class="text-end ">
							<button type="button" id="deleteBtn"
								class="btn bg-gradient-dark py-2 me-3">발주삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/js.jsp"%>
<script type="text/javascript">
<script>
$(document).ready(function() {
	loadmaterialorders();

	if ($("#searchword").val()) {
		$(".input-group").addClass("focused is-focused");
	}

	$(".input-group").click(function() {
		$(this).addClass("focused is-focused");
	});
});

$("#searchbtn").click(function() {
	var value = $("#searchword").val();
	location.href = '/Material/searchlist?searchword=' + value; // 경로 수정
});

$(window).click(function(event) {

	if (!$(event.target).closest('.input-group').length) {
		if (!$("#searchword").val()) {
			$(".input-group").removeClass("focused is-focused");
		}
	}
});

$(document).ready(function(){
		// 필요한 변수 저장
		var formObj = $("form[role='form']");
		
		// 체크박스 전체선택 기능
		$("#cbx_chkAll").click(function() {
			if ($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
			else $("input[name=chk]").prop("checked", false);
		});
	
		// 삭제 버튼 클릭시, 창고 번호를 사용해서 삭제 처리
		$("#deleteBtn").click(function(){
			var chkboxes = $("input[name='chk']:checked");
			
			 if (chkboxes.length === 0) {
		            swal({
		                title: "삭제할 발주를 선택해주세요",
		                icon: "warning",
		                buttons:{
		                    confirm: true
		                }
		            });
		            return;
		        }
			
			swal({
				  title: "정말 삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true
				})
				.then((willDelete) => {
				  if (willDelete) {
					swal("삭제 완료", {icon: "success"}).then(function(){
						$("#closebtn").click();
						formObj.attr("action","/Material/deleteMaterial");
						formObj.submit();
					});							
				  }
			});	
		});
		
		// 상태 변경
		 $('table tr').each(function() {
		        var statusText = $(this).find('#wMainStatus').text();
//		        console.log('Status Text:', statusText);
		        switch(statusText){
		        case "Y": $(this).find('#wMainStatus').addClass("bg-gradient-success"); break; // 초록
		        case "N": $(this).find('#wMainStatus').addClass("bg-gradient-danger"); break;   // 빨강
		        }
		 });
		
	});
	
function popupMaterialwriteForm() {
	const width = 900;
	const height = 900;
	// const left = 500;
	// const top = 500;

	// 현재 창의 중앙 좌표 계산
	//	const left = (window.innerWidth - width) / 2
	//			+ window.screenLeft;
	//				const top = (window.innerHeight - height) / 2
	//		+ window.screenTop;

	console.log(`width=${width}`);
	console.log(width);
	// 팝업 창 열기
	window.open("/Material/MaterialwriteForm", "popup",
			" width = 900px, height = 900px, left = 900px, top = 900px ");
}
	
</script>

