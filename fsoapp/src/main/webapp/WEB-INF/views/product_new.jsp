<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="mtm2017.fsoapp.model.Product"%>
<jsp:include page="page_header.jsp" />

<%
	//Obtem o objeto 'produto' do request, caso esteja voltando de um erro por ter SKU igual ja existente
	Product p = (Product) request.getAttribute("product");
%>

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
		<li class="breadcrumb-item active">Add New Product</li>
	</ul>
</div>
			
<!-- Exibe mensagem se houver -->
<c:if test="${msgRetorno ne null and not msgRetorno.isEmpty()}">
	<div class='alert alert-${msgRetornoTipo}'>${msgRetorno}</div>
</c:if>

<section class="forms">
	<div class="container-fluid">
		<div class="row">
			<!-- Basic Form-->
			<div class="col-lg-6">
				<div class="card">
					<div class="card-close"></div>
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">Add New Product</h3>
					</div>
					<div class="card-body">
						<c:url var="addAction" value="product/add"></c:url>
						<form:form id="form_new_product" action="${addAction}"
							modelAttribute="product" enctype="multipart/form-data">
							<div class="form-group">
								<label class="form-control-label">SKU</label> <input name="SKU"
									style="" placeholder="Stock Keeping Unit" class="form-control"
									type="text" maxlength="5" required="required"
									<%if(p != null) out.print("value='" + p.getSKU() + "'" ); %>>
							</div>
							<div class="form-group">
								<label class="form-control-label">Price</label> <input
									name="price" placeholder="Price" class="form-control"
									type="number" max="99999" step="0.01" required="required"
									<%if(p != null) out.print("value='" + p.getPrice() + "'" ); %>>
							</div>
							<div class="form-group">
								<label class="form-control-label">Cost</label> <input
									name="cost" placeholder="Cost" class="form-control"
									type="number" max="99999" step="0.01"
									<%if(p != null) out.print("value='" + p.getCost() + "'" ); %>>
							</div>
							<div class="form-group">
								<label class="form-control-label">Cost of Doing Business</label>
								<input name="codb" max="99999" placeholder="Cost of Doing Business"
									class="form-control" type="number" step="0.01"
									<%if(p != null) out.print("value='" + p.getCodb() + "'" ); %>>
							</div>
							<div class="form-group">
								<label class="form-control-label">Dimension Unit</label> <input
									name="dunit" style="" placeholder="Dimension Unit"
									class="form-control" type="text" maxlength="4"
									<%if(p != null) out.print("value='" + p.getDunit() + "'" ); %>>
							</div>
							<div class="form-group">
								<label class="form-control-label">Name</label> <input
									name="name" placeholder="Name" class="form-control" type="text"
									maxlength="47" required="required"
									<%if(p != null) out.print("value='" + p.getName() + "'" ); %>>
							</div>
							<div class="form-group">
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