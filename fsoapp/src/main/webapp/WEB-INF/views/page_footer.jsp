
<!-- Page Footer-->
<footer class="main-footer">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<p>Flours, Sugars and Oils Co.</p>
			</div>
			<div class="col-sm-6 text-right">
				<p>
					Design by <a href="https://bootstrapious.com/admin-templates"
						class="external">Bootstrapious</a>
				</p>
				<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
			</div>
		</div>
	</div>
</footer>
</div>
</div>
</div>
<!-- Javascript files-->
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/vendor/popper.js/umd/popper.min.js">
	
</script>
<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/vendor/jquery.cookie/jquery.cookie.js">
	
</script>
<script src="resources/vendor/chart.js/Chart.min.js"></script>
<script src="resources/vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="resources/js/charts-home.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Datepicker -->
<script>
	$(function() {
		$("#shipdate_picker").datepicker({
			dateFormat : "mm/dd/yy",
			minDate : 0,
			showAnim : "fadeIn"
		});
	});
</script>

<!-- Adicionar itens ao pedido -->
<script type="text/javascript">
	faixasCount = 1;
	var max_faixas = 10;
	$(function() {
		$('#faixa_' + faixasCount++).show();
		$('#addFaixa').click(function() {
			if (faixasCount <= max_faixas) {
				if (faixasCount == max_faixas)
					$('#div_addFaixa').hide();
				$('#faixa_' + faixasCount++).show();
				$('#input_sku_' + (faixasCount - 1)).focus();
			}
		});
	});
</script>

<!-- Busca e exibe Cliente -->
<script type="text/javascript">
	$('#input_cid').blur(
			function() {
				var cid_get = $(this).val();

				if (cid_get) {
					
					cid_get = pad(cid_get.toUpperCase(), 6);
					$(this).val(cid_get);
					
					$.ajax({
						type : "GET",
						url : "costumer/get",
						data : {
							cid : cid_get
						},
						success : function(data) {

							if (data.client != null) {
								$("#client_name").val(data.client);

							} else {
								$('#input_cid').val("");
								$('#client_name').val("");
								alert('Client #' + cid_get
										+ ' not found.');
							}
						},
						error : handleAjaxError
					});
				}
			});

	function handleAjaxError(xhr, status, error) {
		alert("Sorry. There was a request error.");
	};
</script>

<!-- Busca SKU e exibe produto -->
<script type="text/javascript">
	$('.sku_field').blur(
			function() {
				var input_sku_id = $(this).attr('id');
				var index = input_sku_id.substring(10);
				if ($(this).val()) {
					var sku_get = $("#input_sku_" + index).val();

					$.ajax({
						type : "GET",
						url : "product/getItem",
						data : {
							sku : sku_get
						},
						success : function(data) {

							if (data.name) {
								$('#output_' + index).val(data.name);
								var price = format_currency(data.price, '$');
								$('#price_' + index).val(price);
								$('#price_visible_' + index).val(price);
								$('#qty_' + index).blur();
								$('#qty_' + index).focus();

							} else {
								$("#output_" + index).val("");								
								$("#price_" + index).val("$ 0.00");
								$("#price_visible_" + index).val("$ 0.00");
								$("#qty_" + index).val("0").blur();
								$("#input_sku_" + index).val("").focus();
								alert('Product ' + sku_get.toUpperCase()
										+ ' not found.');
							}
						},
						error : handleAjaxError
					});
				}
				else
					{
						$('#output_' + index).val("");
						$("#price_" + index).val("$ 0.00");
						$("#price_visible_" + index).val("$ 0.00");
						$("#qty_" + index).val("0").blur();
					}
			});

	function handleAjaxError(xhr, status, error) {
		alert("Sorry. There was a request error.");
	};
</script>

<!-- Calcula o total do item -->
<script type="text/javascript">
	$('.quantField')
			.blur(
					function() {

						var qty_id = $(this).attr('id'); // qty_1
						var index = qty_id.substring(4); // 1

						var price_field = $('#price_' + index);
						var item_total_field = $('#item_total_' + index);

						var item_total = price_field.val().substring(2)
								* $(this).val(); // 78.50 * 10 = 785

						item_total_field.show();
						item_total_field.val(format_currency(item_total, '$')); // 785.00

						total = "0";
						for (i = 1; i <= 10; i++) {
							total = parseFloat(total)
									+ ($("#qty_" + i).val() * $("#price_" + i)
											.val().substring(2));
						}
						var total_field = $("#total_field");
						total_field
								.val("TOTAL: " + format_currency(total, "$"));
					});

	function handleAjaxError(xhr, status, error) {
		alert("Sorry. There was a request error.");
	};
</script>

<!-- Prevent Enter to send form -->
<script type="text/javascript">
	$(document).ready(function() {
		$(window).keydown(function(event) {
			if (event.keyCode == 13) {
				event.preventDefault();
				return false;
			}
		});
	});
</script>


<!-- Converte numeros em moeda -->
<script>
	function format_currency(n, currency) {
		return currency + " "
				+ n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
	}
</script>

<!-- Adiciona zeros a esquerda -->
<script>
	function pad(a, b) {
		return (1e15 + a + "").slice(-b)
	}
</script>

<!-- Main File-->
<script src="resources/js/front.js"></script>
</body>
</html>