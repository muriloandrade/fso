<%@page import="mtm2017.fsoapp.model.Order"%>
<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<li class="breadcrumb-item"><a href="order/list?cid=${order.costumer.CID}">List Orders By Client</a></li>
		<li class="breadcrumb-item active">Order Update Status</li>
	</ul>
</div>

<section class="tables">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">
							
							<c:out value="${order.costumer.client}" />
						</h3>
					</div>
					<div class="card-body" style="text-align: center;">
						<c:url var="updateStatusAction" value="order/update_status"></c:url>
						<form:form id="form_update_status" action="${updateStatusAction}"
							enctype="multipart/form-data">
							
							<input name="OID" value="${order.OID}" style="display: none" />
							<input name="CID" value="${order.costumer.CID}" style="display: none" />
							<input name="orderdate" value="${order.orderdate}" style="display: none" />
							<c:if test='${not empty order.shipdate}'><input name="shipdate" value="${order.shipdate}" style="display: none" /></c:if>
							<input name="total" value="${order.total}" style="display: none" />
														
							
						<table class="table">
							<thead>
								<tr>
									<th>Order #</th>
									<th>Date</th>
									<th>Est. Ship Date</th>
									<th>Status</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody>
								
								<tr>
									<fmt:formatNumber type="number" pattern="000000"
										value="${order.OID}" var="OID" />
									<td>${OID}</td>
									<td><fmt:formatDate type="date" pattern="MM/dd/yyyy"
											value="${order.orderdate}" /></td>
									<td><fmt:formatDate type="date" pattern="MM/dd/yyyy"
											value="${order.shipdate}" /></td>
									<td>
										<div class="form-group" style="margin: 0">
											<select name="orderstatus" style="margin: 0">
											
												<option value="${order.orderstatus}"><c:out value="${order.orderstatus}" /></option>
												<option disabled>_________</option>												
												<option value="pending">PENDING</option>												
												<option value="completed">COMPLETED</option>												
												<option value="shipped">SHIPPED</option>												
												<option value="delivered">DELIVERED</option>												
												<option value="canceled">CANCELED</option>
									
											</select>
										</div>

									</td>
									<td><fmt:formatNumber type="currency" currencySymbol="$  "
											value="${order.total}" /></td>
								</tr>
								<tr>
									<td colspan="7" style="border: none; padding: 0"><div class="line" style="border-bottom: 3px solid #eee; margin: 10px 0"></div></td>
								</tr>

							</tbody>
						</table>

							<div class="form-group" style="text-align: right;">
								<input value="Submit" class="btn btn-primary" type="submit">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="page_footer.jsp" />