<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<li class="breadcrumb-item active">Add New Order</li>
	</ul>
</div>

<section class="forms">
	<div class="container-fluid">
		<div class="row">
			<!-- Basic Form-->
			<div class="col-lg-8">
				<div class="card">
					<div class="card-close"></div>
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">Add New Order</h3>
					</div>
					<div class="card-body">
						<c:url var="addAction" value="order/add"></c:url>
						<form:form id="form_new_order" action="${addAction}"
							enctype="multipart/form-data">


							<table class="table">
								<tbody>
									<tr>
										<!-- CLIENT # -->
										<td style="width: 200px;"><label
											class="form-control-label">Client #</label> <input
											id="input_cid" name="cid" placeholder="Client #"
											maxlength="6" class="mr-3 form-control" type="text"
											style="text-transform: uppercase;" required="required"></td>

										<!-- CLIENT NAME -->
										<td><label class="form-control-label"> </label><input
											id="client_name" name="client" maxlength="35"
											class="mr-3 form-control" type="text"
											style="background-color: white; border: 0;"
											readonly="readonly" disabled="disabled" required="required"></td>

										<!-- SHIP DATE -->
										<td style="width: 250px;"><label
											class="form-control-label">Est. Ship Date</label> <input
											name="shipdate" placeholder="Ship Date"
											class="mr-3 form-control" type="text" id="shipdate_picker"
											style="text-transform: uppercase;"></td>
									</tr>
								</tbody>
							</table>


							<div class="line"
								style="border-bottom: 3px solid #eee; margin: 10px 0"></div>


							<table class="table">
								<thead>
									<tr style="text-align: center;">
										<th style="width: 10px;">Item</th>
										<th style="width: 100px;">SKU</th>
										<th>Item Description</th>
										<th style="width: 130px;">Quantity</th>
										<th style="width: 150px;">Price</th>
										<th style="width: 150px;">Total</th>
									</tr>
								</thead>
								<tbody>


									<c:forEach begin="1" end="10" varStatus="loop">
										<tr id="faixa_${loop.index}" style="display: none;">
											<td style="width: 10px">#<c:out value="${loop.index}" />
											</td>

											<!-- SKU -->
											<td style="width: 100px;"><input
												id="input_sku_${loop.index}" name="sku_${loop.index}"
												placeholder="SKU" maxlength="5"
												class="mr-3 form-control sku_field" type="text"
												style="text-transform: uppercase;"></td>

											<!-- NOME DO PRODUTO -->
											<td><input id="output_${loop.index}"
												style="background-color: white; border: 0; display: inherit"
												class="mr-3 form-control" type="text" readonly="readonly"
												disabled="disabled"></td>

											<!-- QUANTIDADE -->
											<td style="width: 130px;"><input id="qty_${loop.index}"
												name="qty_${loop.index}" placeholder="Quantity"
												maxlength="999" class="mr-3 form-control quantField"
												value="0" type="text" style="display: inherit"></td>

											<!-- PRICE -->
											<td style="width: 150px;"><input
												id="price_${loop.index}" class="mr-3 form-control"
												type="text" name="price_${loop.index}"
												style="display: none;" value="$ 0.00" readonly="readonly">
												
												<input id="price_visible_${loop.index}" placeholder="Price"
												class="mr-3 form-control" type="text"
												style="background-color: white; text-align: center; border: 0; display: inherit;"
												value="$ 0.00" readonly="readonly" disabled="disabled">
											</td>

											<!-- ITEM TOTAL -->
											<td style="width: 150px;"><input
												id="item_total_${loop.index}" placeholder="Item Total"
												class="mr-3 form-control" type="text"
												style="background-color: white; text-align: center; border: 0; display: inherit"
												value="$ 0.00" readonly="readonly" disabled="disabled"></td>
										</tr>
									</c:forEach>
									<tr>
										<!-- + -->
										<td id="div_addFaixa" colspan="7"
											style="border-bottom: 1px solid #e9ecef"><a
											id="addFaixa" type="button" href="javascript:;"><i
												class="fa fa-plus "></i></a></td>
									</tr>

									<tr>
										<td colspan="7" style="border: none; padding: 0"><div
												class="line"
												style="border-bottom: 3px solid #eee; margin: 10px 0"></div></td>
									</tr>

									<tr>
										<!-- TOTAL -->
										<td colspan="7" style="border: none; padding: 0 .75rem"><input
											id="total_field" placeholder="Total"
											class="mr-3 form-control" type="text" name="total"
											style="background-color: white; text-align: right; border: 0; font-size: larger;"
											value="TOTAL: $ 0.00" readonly="readonly"></td>
									</tr>
								</tbody>
							</table>


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