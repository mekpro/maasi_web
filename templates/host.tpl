<html>
<head>
  <title>Hostname - MaaSi</title>
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
        <a class="brand" href="#">MaaSi</a> 
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
        <h3>hostlist</h3>
        <ul>
          {% for host in hostlist %}
            <li><a href='/host/{{host}}'>{{host}}</a></li>
          {% endfor %}
        </ul>
      </div>
      <div class="span9">
        <h1>Hostname Data </h1>
          {% for module in data.items %}
            <h2>{{module.0}} </h2>
            {% for metric in module.1.items %}
              <h3> {{metric.0}} </h3>
            {% endfor %}
          {% endfor %}
        </h3>
      </div>
    </div>
  </div>

</body>
</html>
