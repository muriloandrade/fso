<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="base"
	value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />

<c:import url="page_header.jsp" />

<!-- Page Header 
				<header class="page-header">
					<div class="container-fluid">
						<h2 class="no-margin-bottom">  </h2>
					</div>
				</header>
				-->

<!-- Exibe mensagem se houver -->
<c:if test="${msgRetorno ne null and not msgRetorno.isEmpty()}">
	<div class='alert alert-${msgRetornoTipo}'>${msgRetorno}</div>
</c:if>

<section class="dashboard-counts no-padding-bottom">
	<div class="row" style="padding: 0 15px">
		<div class="chart col-lg-12 col-12">
			<div class="statistic d-flex align-items-center bg-white has-shadow">
				<div class="text" style="color: gray; line-height: 2.2">
					Welcome to <br /> <strong><span style="color: #999">Flours,
							Sugars and Oils Co.</span></strong> <br />Application Services
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<!-- Client operations -->
		<div class="chart col-xl-3 col-lg-6 col-md-6 col-sm-12 " style="padding: 20px 15px">
			<div class="statistic d-flex align-items-center bg-white has-shadow">
				<div class="icon" style="background: #33b35a">
					<i class="icon-user"></i>
				</div>
				<div class="text">Client operations</div>
			</div>
			<div class="align-items-center bg-white has-shadow">
				<nav class="side-navbar"
					style="max-width: none; margin-left: 0; min-height: 300px">
					<ul class="list-unstyled ">

						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="client/list" aria-expanded="false"
									style="padding-left: 15px;">List All Clients</a></li>
							</ul></li>

						<li style="margin-bottom: 15px; padding: 0 15px;""><ul
								class="list-unstyled">
								<li><a href="client/addscreen" aria-expanded="false"
									style="padding-left: 15px;">Add New Client</a></li>
							</ul></li>




						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_edit_client" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Edit
										Client</a>
									<ul id="drop_edit_client" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="editClient" value="client/editscreen"></c:url>
												<form:form id="form_edit_client" action="${editClient}"
													modelAttribute="costumer" enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control number_only" type="text"
																placeholder="Client number" name="cid"
																style="padding: 0 0.5rem" required="required"
																maxlength="6"><span class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_client_lookup" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Client
										Lookup</a>
									<ul id="drop_client_lookup" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="clientLookup" value="client/lookup"></c:url>
												<form:form id="form_edit_client" action="${clientLookup}"
													modelAttribute="costumer" enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control number_only" type="text"
																placeholder="Client number" name="cid"
																style="padding: 0.1rem 0.5rem" required="required"
																maxlength="6"><span class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>

					</ul>
				</nav>
			</div>
		</div>
		<!-- Product operations -->
		<div class="chart col-xl-3 col-lg-6 col-md-6 col-sm-12 " style="padding: 20px 15px">
			<div class="statistic d-flex align-items-center bg-white has-shadow">
				<div class="icon" style="background: #33b35a">
					<i class="icon-pencil-case"></i>
				</div>
				<div class="text">Product operations</div>
			</div>
			<div class="align-items-center bg-white has-shadow">
				<nav class="side-navbar"
					style="max-width: none; margin-left: 0; min-height: 300px">
					<ul class="list-unstyled ">

						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="product/list" aria-expanded="false"
									style="padding-left: 15px;">List All Products</a></li>
							</ul></li>

						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="product/addscreen" aria-expanded="false"
									style="padding-left: 15px;">Add New Product</a></li>
							</ul></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_edit_product" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Edit
										Product</a>
									<ul id="drop_edit_product" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="editProduct" value="product/editscreen"></c:url>
												<form:form id="form_edit_product" action="${editProduct}"
													modelAttribute="product" enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control" type="text" placeholder="SKU"
																name="sku" style="padding: 0 0.5rem" required="required"
																maxlength="5"><span class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_product_lookup" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Product
										Lookup</a>
									<ul id="drop_product_lookup" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="productLookup" value="product/lookup"></c:url>
												<form:form id="form_edit_product" action="${productLookup}"
													modelAttribute="product" enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control" type="text" placeholder="SKU"
																name="sku" style="padding: 0.1rem 0.5rem"
																required="required" maxlength="5"><span
																class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>

					</ul>
				</nav>
			</div>
		</div>
		<!-- Order operations -->
		<div class="chart col-xl-3 col-lg-6 col-md-6 col-sm-12 " style="padding: 20px 15px">
			<div class="statistic d-flex align-items-center bg-white has-shadow">
				<div class="icon" style="background: #33b35a">
					<i class="icon-form"></i>
				</div>
				<div class="text">Order operations</div>
			</div>
			<div class="align-items-center bg-white has-shadow">
				<nav class="side-navbar"
					style="max-width: none; margin-left: 0; min-height: 300px">
					<ul class="list-unstyled ">


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_orders_list" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">List
										Orders by Client</a>
									<ul id="drop_orders_list" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="listOrders" value="order/list"></c:url>
												<form:form id="form_edit_product" action="${listOrders}"
													modelAttribute="product" enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control number_only" type="text"
																placeholder="Client number" name="cid"
																style="padding: 0.1rem 0.5rem" required="required"
																maxlength="6"><span class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="order/addscreen" aria-expanded="false"
									style="padding-left: 15px;">Add New Order</a></li>
							</ul></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_order_update" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Update
										Order's Status</a>
									<ul id="drop_order_update" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="updateStatus" value="order/update_status_screen"></c:url>
												<form:form id="form_edit_product" action="${updateStatus}"
													 enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control number_only" type="text"
																placeholder="Order number" name="oid"
																style="padding: 0.1rem 0.5rem" required="required"
																maxlength="6"><span class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>







						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_order_lookup" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Order
										Lookup</a>
									<ul id="drop_order_lookup" class="collapse list-unstyled ">
										<li>
											<div class="card-body" style="padding: 0.75rem">
												<c:url var="orderLookup" value="order/lookup"></c:url>
												<form:form id="form_edit_product" action="${orderLookup}"
													modelAttribute="product" enctype="multipart/form-data">
													<div class="form-group">
														<div class="input-group">
															<input class="form-control number_only" type="text"
																placeholder="Order number" name="oid"
																style="padding: 0.1rem 0.5rem" required="required"
																maxlength="6"><span class="input-group-btn">
																<button type="submit" class="btn btn-primary"
																	style="padding: 0.2rem 0.75rem">Go</button>
															</span>
														</div>
													</div>
												</form:form>
											</div>
										</li>
									</ul></li>
							</ul></li>









					</ul>
				</nav>
			</div>
		</div>
		<!-- Statistics -->
		<div class="chart col-xl-3 col-lg-6 col-md-6 col-sm-12" style="padding: 20px 15px">
			<div class="statistic d-flex align-items-center bg-white has-shadow">
				<div class="icon" style="background: #33b35a">
					<i class="icon-line-chart"></i>
				</div>
				<div class="text">Statistics</div>
			</div>
			<div class="align-items-center bg-white has-shadow">
				<nav class="side-navbar"
					style="max-width: none; margin-left: 0; min-height: 300px">
					<ul class="list-unstyled ">

						<li style="margin-bottom: 15px; padding: 0 15px;">
						<ul
								class="list-unstyled">
								<li><a href="#drop_prod_ranking" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Products
										Sales Ranking</a>
									<ul id="drop_prod_ranking" class="collapse list-unstyled ">
										<li><a href="stats/prod_ranking?d=30">30 days</a></li>
										<li><a href="stats/prod_ranking?d=90">90 days</a></li>
										<li><a href="stats/prod_ranking?d=180">180 days</a></li>
										<li><a href="stats/prod_ranking?d=360">1 year</a></li>
									</ul></li>
							</ul>
							<div class="line"></div></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="#drop_client_ranking" aria-expanded="false"
									data-toggle="collapse" style="padding-left: 15px">Customers Purchase Ranking</a>
									<ul id="drop_client_ranking" class="collapse list-unstyled ">
										<li><a href="stats/client_ranking?d=30">30 days</a></li>
										<li><a href="stats/client_ranking?d=90">90 days</a></li>
										<li><a href="stats/client_ranking?d=180">180 days</a></li>
										<li><a href="stats/client_ranking?d=360">1 year</a></li>
									</ul></li>
							</ul></li>


						<li style="margin-bottom: 15px; padding: 0 15px;"><ul
								class="list-unstyled">
								<li><a href="stats/total" aria-expanded="false"
									style="padding-left: 15px;">Total Sales / Avg. Value of
										Orders</a></li>
							</ul></li>

					</ul>
				</nav>
















			</div>
		</div>
	</div>
</section>

<jsp:include page="page_footer.jsp" />