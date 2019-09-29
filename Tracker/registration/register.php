<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Sign Up</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700&display=swap" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
	<div class="container-fuid mx-0">
		<nav class="navbar navbar-expand-lg container-fluid px-5">
			<a class="navbar-brand" href="../index.html"><img src="../assets/logo.png
				" style= "width: 70px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"><i class="fa fas fa-bars fa-2x"></i></span>
      </button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-2">
            <a class="nav-link about-btn" href="login.php">Log In</a>
          </li>
				  <li class="nav-item mx-2">
					<a class="nav-link about-btn" href="../about-app.html">About App</a>
				  </li>
				</ul>
			  </div>
			</nav>
		</div>



	<div class="container">
		<form method="post" action="register.php">
			<div class="row d-flex justify-content-center text-center  ">
				<div class="col-lg-7 col-md-8 col sm-12 reg py-5 px-4 px-5">
					<div class="row d-flex justify-content-center text-center flex-column align-items-center">
						<div class="col-8 text-center">
							<h1 class="text-center">REGISTER</h1>
							<p class="text-h3">Already have an account? <a href="login.php">Login</a> </p>
						</div>
						<?php include('errors.php'); ?>
					</div>
					
					<div class="row d-flex justify-content-center align-items-center">
						<div class="col-8 mt-2 py-2">
							<input type="text" name="username" value="<?php echo $username; ?>" class="form-control" placeholder="Username">
						</div>
					</div>
					
					<div class="row d-flex justify-content-center align-items-center ">
						<div class="col-8 mt-2 my-2 py-2">
							<input type="email" name="email" value="<?php echo $email; ?>" class="form-control" placeholder="email">
						</div>
					</div>
					
					<div class="row d-flex justify-content-center align-items-center ">
						<div class="col-8 mt-2 my-2 py-2">
							<input type="password" name="password_1" class="form-control" placeholder="Password">
						</div>
					</div>
					
					<div class="row d-flex justify-content-center align-items-center ">
						<div class="col-8 mt-2 my-2 py-2"">
							<input type="password" name="password_2"  placeholder="Confirm password" class="form-control">
						</div>
					</div>
					
					<div class="input-group justify-content-center">
						<button type="submit" class="btn btn-primary mt-2" name="reg_user">Sign Up</button>
					</div>
					
					<p>
						Already a member? <a href="login.php">Sign in</a>
					</p>
				</div>
			</div>
		</form>
	</div>


	<script src="../js/jquery-3.4.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
</body>
</html>