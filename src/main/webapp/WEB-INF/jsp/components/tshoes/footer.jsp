<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="footer">
		<div class="wrap">
			<div class="footer-left">
				<ul>
					<li><a href="#">United Kingdom</a> <span> </span></li>
					<li><a href="#">Terms of Use</a> <span> </span></li>
					<li><a href="#">Nike Inc.</a> <span> </span></li>
					<li><a href="#">Launch Calendar</a> <span> </span></li>
					<li><a href="#">Privacy & Cookie Policy</a> <span> </span></li>
					<li><a href="#">Cookie Settings</a></li>
					<div class="clear"> </div>
				</ul>
			</div>
			<div class="footer-right">
				<p>Naymur Rahman Creation</p>
				<script type="text/javascript">
					$(document).ready(function () {
						/*
						var defaults = {
								containerID: 'toTop', // fading element id
							containerHoverID: 'toTopHover', // fading element hover id
							scrollSpeed: 1200,
							easingType: 'linear' 
							};
						*/

						$().UItoTop({ easingType: 'easeOutQuart' });

					});
				</script>
				<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
			</div>
			<div class="clear"> </div>
		</div>
	</div>