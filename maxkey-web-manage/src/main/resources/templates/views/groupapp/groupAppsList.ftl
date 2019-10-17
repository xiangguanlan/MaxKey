<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<#include  "../layout/header.ftl"/>
	<#include  "../layout/common.cssjs.ftl"/>
<script type="text/javascript">	
	
	function iconFormatter(value, row, index){
  			return "<img width='30' height='30' border='0px' src='<@base/>/image/"+value+"'/>";
	};
   	
	$(function () {
		$("#addGroupAppsBtn").on("click",function(){
			var settings={
					url		:	"<@base/>/groupPrivileges/addGroupAppsList/"+$("#groupId").val(),//window url
					title	:	"New",//title
					width	:	"700",//width
					height	:	"500"//height
				};
			$.window(settings);//open window
		});
	});
</script>
</head>
<body> 
<div class="app header-default side-nav-dark">
<div class="layout">
	<div class="header navbar">
		<#include  "../layout/top.ftl"/>
	</div>
	
	<div class="col-md-3 sidebar-nav side-nav" >
 		<#include  "../layout/sidenav.ftl"/>
	</div>
	<div class="page-container">
	
	<div class="main-content">

		<div class="container-fluid">

						<div class="breadcrumb-wrapper row">
							<div class="col-12 col-lg-3 col-md-6">
								<h4 class="page-title">Dashboard 2</h4>
							</div>
							<div class="col-12 col-lg-9 col-md-6">
								<ol class="breadcrumb float-right">
									<li><a href="index.html">Dashboard</a></li>
									<li class="active">/ Dashboard 2</li>
								</ol>
							</div>
						</div>

					</div>

	<div class="container-fluid">
					<div class="col-12 grid-margin">
						<div class="card">
							<div class="card-body">
	<div id="tool_box">
	 		<table   class="datatable">
 				<tr>
		 			<td width="120px"><@locale code="group.name"/>:</td>
		 			<td width="374px">
		 				<form id="basic_search_form">
				 			<input class="groupId" id="groupId" name="groupId" type="hidden" >
				 			<input class="groupName"   style="width:200px"   id="groupName" name="groupName" type="text" >
				 			<input class="button btn btn-success mr-3" id="addBtn" type="button" value="<@locale code="button.text.select"/>" 
						 		    wurl="<@base/>/groups/selectGroupsList"
						 		    wwidth="700"
						 		    wheight="500"
					 		    	target="window">
				 			<input class="button primary"  id="searchBtn" type="button" size="50" value="<@locale code="button.text.search"/>">
				 			
				 		</form>
		 			</td>
				 	<td colspan="2"> <div id="tool_box_right">
				 		<input class="button"  id="advancedSearchExpandBtn" type="button" size="50"  value="<@locale code="button.text.expandsearch"/>" expandValue="<@locale code="button.text.expandsearch"/>"  collapseValue="<@locale code="button.text.collapsesearch"/>">
						<input class="button" id="addGroupAppsBtn" type="button" value="<@locale code="button.text.add.member"/>">
						<input class="button"  id="deleteBtn" type="button" value="<@locale code="button.text.delete.member"/>"
							wurl="<@base/>/groupPrivileges/delete" />
				 	</div>
				 	</td>
				</tr>
			
			</table>
 	</div>
 	

 	<div id="advanced_search">
 		<form id="advanced_search_app_form">
	 		<table   class="datatable">
	 			<tr>
		 			<td width="120px"><@locale code="apps.name"/></td>
		 			<td width="360px">
		 				<input type="text" name="name" style ="width:150px">
		 			</td>
		 			<td width="120px"><@locale code="apps.protocol"/></td>
		 			<td width="360px">
		 				<select name="protocol" class="select_protocol">
		 					<option value=""  selected>Select</option>
		 					<option value="<%=PROTOCOLS.FORMBASED%>"><%=PROTOCOLS.FORMBASED%></option>
		 					<option value="<%=PROTOCOLS.OPEN_ID_CONNECT%>"><%=PROTOCOLS.OPEN_ID_CONNECT%></option>
		 					<option value="<%=PROTOCOLS.OAUTH10A%>"><%=PROTOCOLS.OAUTH10A%></option>
		 					<option value="<%=PROTOCOLS.OAUTH20%>"><%=PROTOCOLS.OAUTH20%></option>
		 					<option value="<%=PROTOCOLS.SAML11%>"><%=PROTOCOLS.SAML11%></option>
		 					<option value="<%=PROTOCOLS.SAML20%>"><%=PROTOCOLS.SAML20%></option>
		 					<option value="<%=PROTOCOLS.COOKIEBASED%>"><%=PROTOCOLS.COOKIEBASED%></option>
		 					<option value="<%=PROTOCOLS.TOKENBASED%>"><%=PROTOCOLS.TOKENBASED%></option>
		 					<option value="<%=PROTOCOLS.DESKTOP%>"><%=PROTOCOLS.DESKTOP%></option>
		 					<option value="<%=PROTOCOLS.BASIC%>"><%=PROTOCOLS.BASIC%></option>
		 					
		 				</select>
		 			</td>
	 			</tr>
	 		</table>
	 	</form>
 	</div>
	<div class="mainwrap" id="main">			
		<table  data-url="<@base/>/groupPrivileges/queryAppsInGroup"
			id="datagrid"
				data-toggle="table"
				data-classes="table table-bordered table-hover table-striped"
				data-click-to-select="true"
				data-pagination="true"
				data-total-field="records"
				data-page-list="[10, 25, 50, 100]"
				data-search="false"
				data-locale="zh-CN"
				data-query-params="dataGridQueryParams"
				data-query-params-type="pageSize"
				data-side-pagination="server">
		<thead>
			<tr>
				<th data-checkbox="true"></th>
				<th data-sortable="true" data-field="id"   data-visible="false">Id</th>
				<th data-field="id" data-formatter="iconFormatter"><@locale code="apps.icon"/></th>
				<th data-field="name"><@locale code="apps.name"/></th>
				<th data-field="protocol"><@locale code="apps.protocol"/></th>
				<th data-field="category"><@locale code="apps.category"/></th>
				<th data-field="vendor"><@locale code="apps.vendor"/></th>
				<th data-field="loginUrl" data-visible="false"><@locale code="log.loginhistory.loginUrl"/></th>
	
			</tr>
		</thead>
	</table>
	</div>
</div>
					</div>
					<footer class="content-footer">
		<#include  "../layout/footer.ftl"/>
	</footer>

	</div>
	
	</div>
</div>

<div id="preloader">
<div class="loader" id="loader-1"></div>
</div>

</body>
</html>