<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/js.jsp"%>

	<div class="col-11 mx-auto">
	<div class="card my-4">
		<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 ">
			<div class="bg-gradient-primary shadow-primary border-radius-lg pt-3 pb-3 pe-3 d-flex">
				<h3 class="text-white text-capitalize ps-5 align-items-center mb-0 py-1"> ${machineCode } </h3>
					<div class="align-items-center d-flex flex-column">
						<div class="input-group input-group-outline">
						</div>
					</div>
				
			</div>
		</div>		
	
		<div class="card-body mx-5 px-0 pb-4">
			<div class="table-responsive p-0">
				<form action="" method="post" id="checkbox_form">
				<table class="table align-items-center mb-0">
							<thead>
								<tr>
									<th class="text-center font-weight-bolder col-1"> status </th>
								</tr>
							</thead>
							<tbody id="statusTableBody">
							<tr>
							<th> 생산 번호 :  </th>
							<td> OOOOO </td>
							</tr>
							
							<tr>
							<th> 생산 제품 :  </th>
							<td> OOOOO </td>
							</tr>
							
							<tr>
							<th> 생산 수량 :  </th>
							<td> OOOOO EA </td>
							</tr>
							
							<tr>
							<th> 생산 완료 시간 :  </th>
							<td> OO : OO </td>
							</tr>
					</tbody>
						</table>
		</form>
			</div>
		</div>
		<div class="col-6 w-100 text-end">		
		<button class="btn bg-gradient-dark fs-6 mb-0 py-2 px-3" onclick="">생산 완료</button>
		<button class="btn bg-gradient-dark fs-6 mb-0 py-2 px-3" onclick="closeWindow()">닫기</button>
		</div>
		<div class="row">
			<div class="col-sm-5">
				
			</div>
		</div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
function closeWindow() {
    window.close();
}
    
    
</script>

