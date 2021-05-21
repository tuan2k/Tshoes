<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<!DOCTYPE HTML>
<html>

<head>
	<title>Tshoes</title>
	<script src="https://www.paypalobjects.com/api/checkout.js"></script>
	<link href="${pageContext.request.contextPath}/resources/tshoes/css/style.css" rel='stylesheet' type='text/css' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->
	<script
		type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	</script>
	<!----webfonts---->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<!----//webfonts---->
	<!----start-alert-scroller---->
	<script src="${pageContext.request.contextPath}/resources/tshoes/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/tshoes/js/jquery.easy-ticker.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#demo').hide();
			$('.vticker').easyTicker();
		});
	</script>
	<!----start-alert-scroller---->
	<!-- start menu -->
	<link href="${pageContext.request.contextPath}/resources/tshoes/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/tshoes/js/megamenu.js"></script>
	<script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>
	<script src="${pageContext.request.contextPath}/resources/tshoes/js/menu_jquery.js"></script>
	<!-- //End menu -->
	<!---slider---->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/tshoes/css/slippry.css">
	<script src="${pageContext.request.contextPath}/resources/tshoes/js/jquery-ui.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/tshoes/js/scripts-f0e4e0c2.js" type="text/javascript"></script>
	<script>
		jQuery('#jquery-demo').slippry({
			// general elements & wrapper
			slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
			// options
			adaptiveHeight: false, // height of the sliders adapts to current slide
			useCSS: false, // true, false -> fallback to js if no browser support
			autoHover: false,
			transition: 'fade'
		});
	</script>
	<!----start-pricerage-seletion---->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/tshoes/js/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/tshoes/css/jquery-ui.css">
	<script type='text/javascript'>//<![CDATA[ 
		$(window).load(function () {
			$("#slider-range").slider({
				range: true,
				min: 0,
				max: 500,
				values: [100, 400],
				slide: function (event, ui) {
					$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
				}
			});
			$("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

		});//]]>  
	</script>
	<!----//End-pricerage-seletion---->
	<!---move-top-top---->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/tshoes/js/move-top.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/tshoes/js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
			});
		});
	</script>
	<!---//move-top-top---->
</head>
<body>		
	<tiles:insertAttribute name="header">
	</tiles:insertAttribute>
	
	
	 <tiles:insertAttribute name="content">
	</tiles:insertAttribute>
	
	<tiles:insertAttribute name="footer">
	</tiles:insertAttribute>
	
</body>

</html>