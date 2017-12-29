<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="page_header.jsp" />

<!-- Page Header -->
<header class="page-header">
	<div class="container-fluid">
		<h3 class="no-margin-bottom">Client Operations</h3>
	</div>
</header>

<!-- Breadcrumb -->
<div class="breadcrumb-holder container-fluid">
	<ul class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Home</a></li>
		<li class="breadcrumb-item"><a href="client/list">List All Clients</a></li>
		<li class="breadcrumb-item active">Client Edit</li>
	</ul>
</div>

<section class="forms">
	<div class="container-fluid">
		<div class="row">
			<!-- Basic Form-->
			<div class="col-lg-6">
				<div class="card">
					<div class="card-close"></div>
					<div class="card-header d-flex align-items-center">
						<h3 class="h4">Edit Client</h3>
					</div>
					<div class="card-body">
						<c:url var="editAction" value="client/edit"></c:url>
						<form:form id="form_edit_client" action="${editAction}"
							modelAttribute="costumer" enctype="multipart/form-data">
							<form:hidden path="CID" value="${costumer.CID}" />

							<div class="form-group">
								<span style="visibility: hidden;"><fmt:formatNumber
										type="number" pattern="000000" value="${costumer.CID}"
										var="CID" /></span> <label class="form-control-label">Client
									#</label> <input name="cid_view" disabled="disabled" value="${CID}"
									class="form-control" type="text" maxlength="35"
									required="required">
							</div>
							<div class="form-group">
								<label class="form-control-label">Name</label> <input
									name="client" value="${costumer.client}" placeholder="Name"
									class="form-control" type="text" maxlength="35"
									required="required">
							</div>
							<div class="form-group">
								<label class="form-control-label">Address</label> <input
									name="street" value="${costumer.street}" placeholder="Address"
									class="form-control" type="text" maxlength="25"
									required="required">
							</div>
							<div class="form-group">
								<label class="form-control-label">City</label>&nbsp;&nbsp; <input
									name="city" value="${costumer.city}" placeholder="City"
									class="form-control" type="text" maxlength="11"
									required="required">
							</div>
							<div class="form-group">
								<label class="form-control-label">State</label><input
									name="state" value="${costumer.state}" placeholder="State"
									class="form-control" type="text" maxlength="2"
									style="max-width: 100px;" required="required">
							</div>
							<br />
							<p>Credit Card Information:</p>
							<div class="form-group">
								<label class="form-control-label">Company:</label> <select
									name="card">
									<option value="${costumer.card}"><c:out
											value="${costumer.card}" /></option>
									<option disabled>_________</option>
									<option value="visa">VISA</option>
									<option value="amex">AMEX</option>
									<option value="mstr">MSTR</option>
								</select>&nbsp;&nbsp;&nbsp; <label class="form-control-label">Exp.
									Month:</label> <select name="mo">
									<option value="${costumer.mo}"><c:out
											value="${costumer.mo}" /></option>
									<option disabled>_________</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>&nbsp;&nbsp;&nbsp; <label class="form-control-label">Exp.
									Year:</label> <select name="yr">
									<option value="${costumer.yr}"><c:out
											value="20${costumer.yr}" /></option>
									<option disabled>_________</option>
									<option value="18">2018</option>
									<option value="19">2019</option>
									<option value="20">2020</option>
									<option value="21">2021</option>
									<option value="22">2022</option>
									<option value="23">2023</option>
									<option value="24">2024</option>
									<option value="25">2025</option>
									<option value="26">2026</option>
									<option value="27">2027</option>
									<option value="28">2028</option>
									<option value="29">2029</option>
									<option value="30">2030</option>
								</select>
							</div>
							<div class="form-group">
								<label class="form-control-label">Account #</label> <input
									name="pan" value="${costumer.pan}" placeholder="Account number"
									class="form-control" type="text" maxlength="19"
									required="required">
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