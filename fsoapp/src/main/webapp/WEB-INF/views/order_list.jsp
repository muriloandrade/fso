<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="page_header.jsp" />

<!-- Page Header -->
<header class="page-header">
	<div class="container-fluid">
		<h3 class="no-margin-bottom">Order Operations</h3>
	</div>
</header>

<!-- Breadcrumb -->
<div class="breadcrumb-holder container-fluid">
	<ul class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Home</a></li>
		<li class="breadcrumb-item"><a href="client/list">List All Clients</a></li>
		<li class="breadcrumb-item active">List Orders By Client</li>
	</ul>
</div>

<!-- Exibe mensagem se houver -->
<c:if test="${msgRetorno ne null and not msgRetorno.isEmpty()}">
	<div class='alert alert-${msgRetornoTipo}'>${msgRetorno}</div>
</c:if>

<section class="tables">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">
							<c:out value="${costumer.client}" />
						</h3>
					</div>
					<div class="card-body" style="text-align: center;">
						<table class="table">
							<thead>
								<tr>
									<th>Order #</th>
									<th>Date</th>
									<th>Est. Ship Date</th>
									<th>Status</th>
									<th>Total</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>									
								<c:if test="${fn:length(ordersList) == 0 }" ><tr><td colspan="7"><div style="margin-top: 30px">No orders found for this client</div></td></tr></c:if>	
								<c:if test="${fn:length(ordersList) > 0 }" >							
								<c:forEach items="${ordersList}" var="order">
									<tr>
										<fmt:formatNumber type="number" pattern="000000"
											value="${order.OID}" var="OID" />	
										<td>${OID}</td>
										<td><fmt:formatDate type="date" pattern="MM/dd/yyyy" value="${order.orderdate}" /></td>
										<td><fmt:formatDate type="date" pattern="MM/dd/yyyy" value="${order.shipdate}" /></td>
										<td>${order.orderstatus}</td>
										<td><fmt:formatNumber type="currency" currencySymbol="$  " value="${order.total}" /></td>
										<td style="text-align: center;"><a
											href="order/update_status_screen?oid=${order.OID}">Update
												Status</a></td>
										<td style="text-align: center;"><a
											href="order/lookup?oid=${order.OID}">Lookup</a></td>
									</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="page_footer.jsp" />