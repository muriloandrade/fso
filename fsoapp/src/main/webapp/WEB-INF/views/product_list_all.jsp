<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
		<li class="breadcrumb-item active">List All Products</li>
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
						<h3 class="h4">Products List</h3>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th>SKU</th>
									<th>Product</th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productsList}" var="product">
									<tr>
										<td>${product.SKU}</td>
										<td>${product.name}</td>
										<td style="text-align: center;"><a
											href="product/editscreen?sku=${product.SKU}">Edit</a></td>
										<td style="text-align: center;"><a
											href="product/lookup?sku=${product.SKU}">Lookup</a></td>
										<td style="text-align: center;"><a
											href="product/remove?sku=${product.SKU}"
											style="color: #dc3545"
											onclick="return confirm('Confirm to remove product SKU = ${product.SKU}?')">Remove</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="page_footer.jsp" />