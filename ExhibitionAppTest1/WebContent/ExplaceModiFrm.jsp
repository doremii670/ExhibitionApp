<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3>전시관 정보 수정</h3>
<form action="ExplaceModiFrm.jsp" method="post" class="text-center" name=""/>
<%
	String code = request.getParameter("CodeChk");
	 // 전역 변수: 설정해서 전시관 관련 정보 찍어줄 변수 생성.
	String sql = "select * from explace where code = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, code);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		do{ 
		
		%>
		<section class="row">
		<div class="col-md-12">
			<table class="table table-response table-striped">
				<tr>
					<th>전시관 코드(수정불가)</th>
					<td><input type="text" name="codes" class="form-inlain form-control" value="<%=times.substring(1,3) %>"/>전시관 코드 가져와서 찍어주세요.</td>
				</tr>
				<tr>
					<th>전시관 이름</th>
					<td><input type="text" name="placename" class="form-control" value="<%=placename %>"/>전시관 이름 가져와서 찍어준 후 수정가능</td>
				</tr>
				<tr>
					<th>위치(수정불가)</th>
					<td>위치 가져와서 찍어주세요.</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" class="form-control" value=" <%=contactno %>" name="contactno"></td>
				</tr>
				<tr>
					<th>개관시간</th>
					<td>
						<h4 class="text-primary">현재운영 시간: <%=out.println(times.substring(1,3) %> 시 <%=times.substring(4,6) + "까지");%></h4>
						<div class="form-group form-inlain">
						OPEN : <input type="text" class="form-inline form-control" value=" <%=times.substring(1,3)%>" name="n1">
						CLOSE : <input type="text" class="form-inline form-control" value=" <%=times.substring(4,6)%>" name="n2">
						</div>
					</td>
				</tr>
				<tr>
					<th>휴관일</th>
					<td><input type="text" class="form-inline form-control" value=" <%=holiday %>" name="holiday"></td>
				</tr>
				<tr>
					<th Colspan="2"><input type="submit" class="form-inline form-control" ></th>
				</tr>
			</table>
		</div>
		</section>
		<%}while(rs.next());
	}else{out.println("조회 실패");}
%>
	
<%@ include file="./include/Footer.jsp" %>