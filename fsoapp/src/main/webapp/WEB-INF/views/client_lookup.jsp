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
		<li class="breadcrumb-item active">Client Lookup</li>
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
						<h3 class="h4">Client Lookup</h3>
					</div>
					<div class="card-body">
						<table class="table">
							<tbody>
								<tr>
									<td style="font-weight: bold;">CLIENT #</td>
									<td>:</td>
									<td colspan="6"><fmt:formatNumber type="number"
											pattern="000000" value="${costumer.CID}" /></td>
								</tr>
								<tr>
									<td style="font-weight: bold;">CLIENT'S NAME</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${costumer.client}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">ADDRESS</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${costumer.street}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">CITY</td>
									<td style="width: 2px">:</td>
									<td colspan="3">${costumer.city}</td>
									<td style="text-align: right; font-weight: bold;">State</td>
									<td style="width: 2px">:</td>
									<td>${costumer.state}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">CARD COMPANY</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${costumer.card}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">EXPIRATION MONTH/YEAR</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${costumer.mo}/${costumer.yr}</td>
								</tr>
								<tr>
									<td style="font-weight: bold;">PRIMARY ACCOUNT #</td>
									<td style="width: 2px">:</td>
									<td colspan="6">${costumer.pan}</td>
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