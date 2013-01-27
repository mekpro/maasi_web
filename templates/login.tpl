<html>
<head>
  <title>MaaSi Login</title>
  <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <style type="text/css">
    body { 
      padding-top: 60px;
      padding-bottom: 40px;
    }
    .sidebar-nav {
      padding: 9px 0;
    }
  </style>
</head>
<body>
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container-fluid">
        <a class="brand" href="#">MaaSi Overview</a> 
        <ul class="nav">
          <li class="active"><a href="#">Overview</a></li>
          <li><a href="#">Host</a></li>
          <li><a href="#">VM</a></li>
          <li><a href="#">Report</a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span3">
      </div>
      <div class="span9">
        <h3>Login</h3>
          <form action='/login' method="POST">
            Username:<input name="username" type="text" value=""></input></br>
            Password:<input name="password" type="password" value=""></input></br>
            <input type="submit" value="login"></input>
          </form>
      </div>
    </div>
  </div>

</body>
</html>
