<html>
<head>
  <title> Cloudtop Web </title>
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
        <a class="brand" href="#">CloudTopWeb</a> 
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
    <h1>{{pagename}}</h1>
    <p>Last Update: {{dt}}</p>
  </div>

</body>
</html>
