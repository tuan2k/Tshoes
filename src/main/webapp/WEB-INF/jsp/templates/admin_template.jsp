<%@include file="/WEB-INF/jsp/components/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%> 
<c:url value="" var="contextadmin" scope="application"/>
<!-- header -->
<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap Admin Theme v3</title>
    <link rel="shortcut icon" type="image/ico" href="resouces/admin/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/css/style1.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>
   	<script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>
  </head>
  <body>
  	
  	<tiles:insertAttribute name="header">
	</tiles:insertAttribute>
<!-- /.header -->
    <div class="page-content">
    	<div class="row">
    	
		<div class="col-md-2">
		  
		   <tiles:insertAttribute name="leftbar">
			</tiles:insertAttribute>
		 </div>
		  
		  <tiles:insertAttribute name="content">
			</tiles:insertAttribute>
		 
		</div><!-- /.row -->
    </div><!-- /.page-content -->

    <!-- Footer -->
    <tiles:insertAttribute name="footer">
	</tiles:insertAttribute>
     

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/resources/admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>
  </body>
</html>
    <!-- /.footer -->