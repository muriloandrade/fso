<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="base"
	value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FSO - Flours, Sugars and Oils Co.</title>
<base href="${base}">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="resources/css/fontastic.css">
<!-- Google fonts - Poppins -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/img/favicon.ico">

<!-- DatePicker needs -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
	<div class="page">
		<!-- Main Navbar-->
		<header class="header">
			<nav class="navbar">
				<div class="container-fluid">
					<div
						class="navbar-holder d-flex align-items-center justify-content-between">
						<!-- Navbar Header-->
						<div class="navbar-header">
							<!-- Navbar Brand -->
							<a href="home" class="navbar-brand">
								<div class="brand-text brand-big">
									<strong>Flours, Sugars and Oils Co.</strong>
								</div>
								<div class="brand-text brand-small">
									<strong>FSO</strong>
								</div>
							</a>
							<!-- Toggle Button-->
							<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
						</div>
					</div>
				</div>
			</nav>
		</header>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<nav class="side-navbar">
				<!-- Sidebar Header-->
				<div class="sidebar-header d-flex align-items-center">
					<a href="home"><img src="resources/img/logo.png"
						class="img-fluid"></a>
				</div>
				<!-- Sidebar Navidation Menus-->
				<ul class="list-unstyled">
					<li><a href="home"> <i class="icon-home"></i>Home
					</a></li>
					<li><a href="#drop_client" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-user"></i>Client
							operations
					</a>
						<ul id="drop_client" class="collapse list-unstyled ">
							<li><a href="client/list">List All Clients</a></li>
							<li><a href="client/addscreen">Add New Client</a></li>



							<li><ul
									class="list-unstyled">
									<li><a href="#drop_edit_client_lat" aria-expanded="false"
										data-toggle="collapse" style="padding-left: 15px">Edit
											Client</a>
										<ul id="drop_edit_client_lat" class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="editClient" value="client/editscreen"></c:url>
													<form:form id="form_edit_client" action="${editClient}"
														modelAttribute="costumer" enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="Client #" name="cid"
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



							<li><ul
									class="list-unstyled">
									<li><a href="#drop_client_lookup_lat"
										aria-expanded="false" data-toggle="collapse"
										style="padding-left: 15px">Client Lookup</a>
										<ul id="drop_client_lookup_lat"
											class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="clientLookup" value="client/lookup"></c:url>
													<form:form id="form_edit_client" action="${clientLookup}"
														modelAttribute="costumer" enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="Client #" name="cid"
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






						</ul></li>
					<li><a href="#drop_products" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-pencil-case"></i>Product
							operations
					</a>
						<ul id="drop_products" class="collapse list-unstyled ">
							<li><a href="product/list">List All Products</a></li>
							<li><a href="product/addscreen">Add New Product</a></li>







							<li><ul
									class="list-unstyled">
									<li><a href="#drop_edit_product_lat" aria-expanded="false"
										data-toggle="collapse" style="padding-left: 15px">Edit
											Product</a>
										<ul id="drop_edit_product_lat" class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="editProduct" value="product/editscreen"></c:url>
													<form:form id="form_edit_product" action="${editProduct}"
														modelAttribute="product" enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="SKU" name="sku" style="padding: 0 0.5rem"
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


							<li><ul
									class="list-unstyled">
									<li><a href="#drop_product_lookup_lat"
										aria-expanded="false" data-toggle="collapse"
										style="padding-left: 15px">Product Lookup</a>
										<ul id="drop_product_lookup_lat"
											class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="productLookup" value="product/lookup"></c:url>
													<form:form id="form_edit_product" action="${productLookup}"
														modelAttribute="product" enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="SKU" name="sku"
																	style="padding: 0.1rem 0.5rem" required="required"
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











						</ul></li>
					<li><a href="#drop_order" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-form"></i>Order
							operations
					</a>
						<ul id="drop_order" class="collapse list-unstyled ">




							<li><ul class="list-unstyled">
									<li><a href="#drop_orders_list_lat" aria-expanded="false"
										data-toggle="collapse" style="padding-left: 15px">List
											Orders by Client</a>
										<ul id="drop_orders_list_lat" class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="listOrders" value="order/list"></c:url>
													<form:form id="form_edit_product" action="${listOrders}"
														modelAttribute="product" enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="Client #" name="cid"
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










							<li><a href="order/addscreen">Add New Order</a></li>







							<li><ul
									class="list-unstyled">
									<li><a href="#drop_order_update_lat" aria-expanded="false"
										data-toggle="collapse" style="padding-left: 15px">Update
											Order's Status</a>
										<ul id="drop_order_update_lat" class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="updateStatus"
														value="order/update_status_screen"></c:url>
													<form:form id="form_edit_product" action="${updateStatus}"
														enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="Order #" name="oid"
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






							<li><ul
									class="list-unstyled">
									<li><a href="#drop_order_lookup_lat" aria-expanded="false"
										data-toggle="collapse" style="padding-left: 15px">Order
											Lookup</a>
										<ul id="drop_order_lookup_lat" class="collapse list-unstyled ">
											<li>
												<div class="card-body" style="padding: 0.75rem">
													<c:url var="orderLookup" value="order/lookup"></c:url>
													<form:form id="form_edit_product" action="${orderLookup}"
														modelAttribute="product" enctype="multipart/form-data">
														<div class="form-group">
															<div class="input-group">
																<input class="form-control" type="text"
																	placeholder="Order #" name="oid"
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





							<li><a href="#">Order Lookup</a></li>
						</ul></li>
					<li><a href="#drop_stats" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-line-chart"></i>Statistics
					</a>
						<ul id="drop_stats" class="collapse list-unstyled ">

							<li style="margin-bottom: 2px solid">
								<ul class="list-unstyled">
									<li><a href="#drop_prod_ranking_lat" aria-expanded="false"
										data-toggle="collapse" style="padding-left: 15px">Products
											Sales Ranking</a>
										<ul id="drop_prod_ranking_lat" class="collapse list-unstyled ">
											<li><a href="stats/prod_ranking?d=30">30 days</a></li>
											<li><a href="stats/prod_ranking?d=90">90 days</a></li>
											<li><a href="stats/prod_ranking?d=180">180 days</a></li>
											<li><a href="stats/prod_ranking?d=360">1 year</a></li>
										</ul></li>
								</ul>
								<div class="line"></div>
							</li>

							<li style="margin-bottom: 2px solid"><ul
									class="list-unstyled">
									<li><a href="#drop_client_ranking_lat"
										aria-expanded="false" data-toggle="collapse"
										style="padding-left: 15px">Customers Purchase Ranking</a>
										<ul id="drop_client_ranking_lat"
											class="collapse list-unstyled ">
											<li><a href="stats/client_ranking?d=30">30 days</a></li>
											<li><a href="stats/client_ranking?d=90">90 days</a></li>
											<li><a href="stats/client_ranking?d=180">180 days</a></li>
											<li><a href="stats/client_ranking?d=360">1 year</a></li>
										</ul></li>
								</ul></li>

							<li><ul class="list-unstyled">
									<li><a href="stats/total" aria-expanded="false"
										style="padding-left: 15px;">Total Sales / Avg. Value of
											Orders</a></li>
								</ul></li>


						</ul></li>
				</ul>
			</nav>
			<div class="content-inner">