<?php 
  session_start(); 

  if (!isset($_SESSION['username'])) {
  	$_SESSION['msg'] = "You must log in first";
  	header('location: login.php');
  }
  if (isset($_GET['logout'])) {
  	session_destroy();
  	unset($_SESSION['username']);
  	header("location: login.php");
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thor Tracker</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,400i,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <section>
        <div class="container-fuid mx-0">
          <nav class="navbar navbar-expand-lg navbar-light bg-light container-fluid px-5">
            <a class="navbar-brand" href="../index.html"><img src="../assets/logo.png
              " style= "width: 70px"><strong>Team Thor Goal Tracker</strong></a>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          			<span class="navbar-toggler-icon"><i class="fa fas fa-bars fa-2x"></i></span>
        			</button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item mx-2">
                  <a class="nav-link g-s py-2 px-4" href="register.php">Get Started</a>
                </li>

                <li class="nav-item mx-2">
                  <a class="nav-link" href="login.php">Login</a>
                </li>

                <li class="nav-item mx-2">
                  <a class="nav-link" href="../about-app.html">About App</a>
                </li>

                <!-- logged in user information -->
                <li class="nav-item mx-2 mt-2 d-flex justify-content-between align-items-center"
									<?php  if (isset($_SESSION['username'])) : ?>
										<p>
											<p class="mx-4"><a href="index.php?logout='1'" style="color: red;">logout</a></p>
										</p>
                    <p><strong><?php echo $_SESSION['username']; ?></strong></p>     
                  <?php endif ?>
                </li>
              </ul>
            </div>
          </nav>
        </div>

        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-4 col-sm-12 col-md-12">

                    <div class="input-group mb-3">
                        <input id="goal-input" type="text" class="form-control" placeholder="Enter a task">
                    </div>
                    <button class="btn btn-primary px-2 " id="add-goal">Add Goal</button> 
                    <ul id="goals"></ul>
                </div>

                <div class="col-4 todo col-sm-12 col-md-6" id="todo"> 
                    <form id="todoForm"> 
                    <input id="todoInput" type="text" class="form-control " placeholder="Enter goals for your task">
                    <button class="btn btn-primary px-2 d-none my-4" id="todoBtn">Add Todo</button> 
                    </form>
                    <span id="current-task"></span>
                    <ul class="d-block goals" id="task">
                      </ul>    
                </div>
                <div class="col-4 text-center col-sm-12 col-md-6">
                  <h3>Goal Progress</h3>
                  <span id="progress"></span>
                </div>
            </div>

          
    </section>
    

    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/script.js"></script>
</body>
</html>
