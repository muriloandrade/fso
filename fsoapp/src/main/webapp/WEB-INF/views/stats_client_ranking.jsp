<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="page_header.jsp" />

<!-- Page Header -->
<header class="page-header">
	<div class="container-fluid">
		<h3 class="no-margin-bottom">Statistics</h3>
	</div>
</header>

<!-- Breadcrumb -->
<div class="breadcrumb-holder container-fluid">
	<ul class="breadcrumb">
		<li class="breadcrumb-item"><a href="home">Home</a></li>
		<li class="breadcrumb-item active">Costumer Purchase Ranking</li>
	</ul>
</div>

<section class="tables">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h4 class="h4">
							Customers Purchase Ranking
						</h4>
					</div>
					<div class="card-header d-flex align-items-center">
						<h5 style="font-weight: normal;">
							Period:
							<c:out value="${period}" />
						</h5>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th style="border-top: none"></th>
									<th style="border-top: none"></th>
									<th colspan="2" style="text-align: center; padding: 0">Revenue</th>
								</tr>
								<tr>
									<th style="text-align: center;">Pos.</th>
									<th>Client</th>
									<th style="text-align: center;">Volume</th>
									<th style="text-align: center;">Perc.</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${clientRanking}" var="clientRank"
									varStatus="loop">
									<tr>
										<td style="text-align: center;"><fmt:formatNumber
												type="number" pattern="00" value="${loop.index + 1}" /></td>
										<td>${clientRank.client}</td>
										<td style="text-align: center;"><fmt:formatNumber
												type="currency" currencySymbol="$  "
												value="${clientRank.sum_sales}" /></td>
										<td style="text-align: center;"><fmt:formatNumber
												type="number" pattern="00.0 %" value="${clientRank.ratio}" /></td>
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