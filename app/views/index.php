<!doctype html>
<html lang="en" ng-app='managerApp'>
<head>
	<meta charset="UTF-8">
	<title app-name></title>
	<link rel="stylesheet" href="http://s.twtstudio.com/twitter-bootstrap/3.1.1/css/bootstrap.min.css" type="text/css" media="screen" title="no title" charset="utf-8">
	<link rel="stylesheet" href="/app/style/app.css" type="text/css" media="screen" title="no title" charset="utf-8">
</head>
<body >

	<!-- main view -->
	<div id="main" class="container" ui-view>

	</div>


	<footer class="copy-right">
		<div class="container">
			<ul>
				<li app-copyright></li>
			</ul>
		</div>
	</footer>

	<script src='http://s.twtstudio.com/angular.js/1.2.10/angular.min.js'></script>
	<script src='http://s.twtstudio.com/angular-ui-router/0.2.8/angular-ui-router.min.js'></script>
	<!--  <script src='http://s.twtstudio.com/anguliar.js/1.2.10/angular-route.min.js'></script> -->
	<script src='http://s.twtstudio.com/angular.js/1.2.10/angular-resource.min.js'></script>
	<script src='http://s.twtstudio.com/angular.js/1.2.10/angular-sanitize.min.js'></script>
	<script src='http://s.twtstudio.com/angular.js/1.2.10/angular-cookies.min.js'></script>
	<script src='http://s.twtstudio.com/angular-ui-bootstrap/0.10.0/ui-bootstrap-tpls.min.js'></script>
	<script src='app/script/app.js'></script>
	<script src='app/script/services/configService.js'></script>
	<script src='app/script/services/authenticationService.js'></script>
	<script src='app/script/directives/configDirective.js'></script>
	<script src='app/script/controllers/dashboardController.js'></script>
	<script src='app/script/controllers/loginController.js'></script>
	<script src='app/script/controllers/sidebarController.js'></script>
	<script>
		angular.module("managerApp").constant("CSRF_TOKEN", '<?php echo csrf_token(); ?>');
	</script>
</body>



</html>
