<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="page_header.jsp" />

<!-- Page Header -->
<header class="page-header">
	<div class="container-fluid">
		<h3 class="no-margin-bottom">Product Operations</h3>
	</div>
</header>

<!-- Breadcrumb -->
<div class="breadcrumb-holder container-fluid">
	<ul class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Home</a></li>
		<li class="breadcrumb-item"><a href="product/list">List All Products</a></li>
		<li class="breadcrumb-item active">Product Lookup</li>
	</ul>
</div>

<!-- Exibe mensagem se houver -->
<c:if test="${msgRetorno ne null and not msgRetorno.isEmpty()}">
	<div class='alert alert-${msgRetornoTipo}'>${msgRetorno}</div>
</c:if>


<section class="tables">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">Product Lookup</h3>
					</div>
					<div class="card-body">
						<table class="table">
							<tbody>							
								<tr>
									<td style="font-weight: bold;">SKU</td>
									<td>:</td>
									<td colspan="6">${product.SKU}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">PRICE</td>
									<td style="width: 2px">:</td>
									<td colspan="6"><fmt:formatNumber type="currency" currencySymbol="$  "
												value="${product.price}" /></td>
								</tr>
								<tr>
									<td style="font-weight: bold;">COST</td>
									<td style="width: 2px">:</td>
									<td colspan="6"><fmt:formatNumber type="currency" currencySymbol="$  "
												value="${product.cost}" /></td>
								</tr>
								<tr>
									<td style="font-weight: bold;">CODB</td>
									<td style="width: 2px">:</td>
									<td colspan="6"><fmt:formatNumber type="currency" currencySymbol="$  "
												value="${product.codb}" /></td>
								</tr>
								<tr>
									<td style="font-weight: bold;">DUNIT</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${product.dunit}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">NAME</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${product.name}</td>
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