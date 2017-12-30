<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="page_header.jsp" />

<!-- Page Header -->
<header class="page-header">
	<div class="container-fluid">
		<h3 class="no-margin-bottom">Orders Operations</h3>
	</div>
</header>

<!-- Breadcrumb -->
<div class="breadcrumb-holder container-fluid">
	<ul class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Home</a></li>
		<li class="breadcrumb-item"><a href="client/list">List All Clients</a></li>
		<li class="breadcrumb-item"><a href="order/list?cid=${order.costumer.CID}">List Orders By Client</a></li>
		<li class="breadcrumb-item active">Order Lookup</li>
	</ul>
</div>

<!-- Exibe mensagem se houver -->
<c:if test="${msgRetorno ne null and not msgRetorno.isEmpty()}">
	<div class='alert alert-${msgRetornoTipo}'>${msgRetorno}</div>
</c:if>

<section class="tables">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-7">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">Order Lookup</h3>
					</div>
					<div class="card-body">
						<table class="table">
							<tbody>
								<tr>
									<td colspan="5"><span style="font-weight: bold;">ORDER
											#</span>&nbsp;&nbsp;: <fmt:formatNumber type="number" pattern="000000"
											value="${order.OID}" /></td>
									<td colspan="3" style="text-align: center;"><span
										style="font-weight: bold">STATUS</span>&nbsp;: ${order.orderstatus}</td>
									<td colspan="5" style="text-align: right;"><span
										style="font-weight: bold;">DATE</span>&nbsp;: <fmt:formatDate type="date" pattern="MM/dd/yyyy" value="${order.orderdate}" /></td>
								</tr>
								<tr style="border-bottom: 2px solid;">
									<td colspan="8"><span style="font-weight: bold;">CLIENT</span>&nbsp;:
										${order.costumer.client}</td>
									<td colspan="5" style="text-align: right;"><span
										style="font-weight: bold">EST. SHIP DATE</span>&nbsp;:
										<fmt:formatDate type="date" pattern="MM/dd/yyyy" value="${order.shipdate}" /></td>
								</tr>
								<tr>
									<td colspan="1" style="text-align: center;"><span
										style="font-weight: bold; padding-top: 1.25rem;">SEQ</span></td>
									<td colspan="7" style="text-align: center;"><span
										style="font-weight: bold; padding-top: 1.25rem;">ITEM DESCRIPTION</span></td>
									<td colspan="1" style="text-align: center;"><span
										style="font-weight: bold; padding-top: 1.25rem;">QTY</span></td>
									<td colspan="2" style="text-align: center;"><span
										style="font-weight: bold; padding-top: 1.25rem;">PRICE</span></td>
									<td colspan="2" style="text-align: center;"><span
										style="font-weight: bold; padding-top: 1.25rem;">TOTAL</span></td>
								</tr>
								<c:if test="${fn:length(orderItems) == 0 }" ><tr><td colspan="13" style="text-align: center;"><div style="margin-top: 30px">No items found for this order</div></td></tr></c:if>	
								<c:if test="${fn:length(orderItems) > 0 }" >
								<c:forEach items="${orderItems}" var="orderItem"
									varStatus="loop">
									<tr>
										<td colspan="1" style="text-align: center;">${loop.index + 1}</td>
										<td colspan="7" style="text-align: center;">${orderItem.product.name}</td>
										<td colspan="1" style="text-align: center;">${orderItem.quant}</td>
										<td colspan="2" style="text-align: center;"><fmt:formatNumber type="currency" currencySymbol="$  "
												value="${orderItem.price}" /></td>
										<td colspan="2" style="text-align: center;"><fmt:formatNumber type="currency" currencySymbol="$  "
												value="${orderItem.quant * orderItem.price}" /></td>
									</tr>
								</c:forEach>
								</c:if>

								<tr style="border-top: 2px solid;">
									<td colspan="13" style="text-align: right;"><span
										style="font-weight: bold; font-size: larger;">TOTAL</span>&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
										<span style="font-size: larger;"><fmt:formatNumber currencySymbol="$  "
												type="currency" value="${order.total}" /></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>








<jsp:include page="page_footer.jsp" />