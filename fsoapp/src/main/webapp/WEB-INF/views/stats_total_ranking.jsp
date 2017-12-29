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
		<li class="breadcrumb-item active">Total Sales / Avg. Value of Orders</li>
	</ul>
</div>

<section class="tables">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header d-flex align-items-center">
						<h4 class="h4">Total Sales / Avg. Value of Orders</h4>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th style="text-align: center;">Period</th>
									<th style="text-align: center;">Total Sales</th>
									<th style="text-align: center;"># of Orders</th>
									<th style="text-align: center;">Avg. Value of Orders</th>
								</tr>
							</thead>
							<tbody>
							
								<!-- 30 DAYS -->
								<tr>
									<td style="text-align: center;">30 days</td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total30.total_sales}" /></td>
									<td style="text-align: center;"><c:out
											value="${total30.quant_orders}" /></td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total30.average}" /></td>
								</tr>
							
								<!-- 90 DAYS -->
								<tr>
									<td style="text-align: center;">90 days</td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total90.total_sales}" /></td>
									<td style="text-align: center;"><c:out
											value="${total90.quant_orders}" /></td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total90.average}" /></td>
								</tr>
							
								<!-- 180 DAYS -->
								<tr>
									<td style="text-align: center;">180 days</td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total180.total_sales}" /></td>
									<td style="text-align: center;"><c:out
											value="${total180.quant_orders}" /></td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total180.average}" /></td>
								</tr>
							
								<!-- 1 YEAR -->
								<tr>
									<td style="text-align: center;">1 year</td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total360.total_sales}" /></td>
									<td style="text-align: center;"><c:out
											value="${total360.quant_orders}" /></td>
									<td style="text-align: center;"><fmt:formatNumber
											type="currency" currencySymbol="$  "
											value="${total360.average}" /></td>
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