<html>
<head>
  <title>Hostname - MaaSi</title>
  <script src="/static/jquery.js"></script>
  <script src="/static/flotr2.min.js"></script>
  <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <style type="text/css">
    body { 
      padding-top: 60px;
      padding-bottom: 40px;
    }
    .sidebar-nav {
      padding: 9px 0;
    }

    .graph {
      width: 320px;
      height: 240px;
      margin: 8px auto;
    }

    #kuay {
      width: 320px;
      height: 240px;
      margin: 8px auto;
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
              <div class="graph" id={{module.0}}{{metric.0}}></div>
              <script>
                f = document.getElementById('{{module.0}}{{metric.0}}')
                graph = Flotr.draw(f, [[[0,10],[2,2],[30,3],[40,4]]],
                  {});
              </script>
            {% endfor %}
          {% endfor %}
        </h3>
      </div>
    </div>
  </div>

<div id=kuay></div>
<script> Flotr.draw(document.getElementById('kuay'), [[1,1],[2,2],[8,3]]); </script>

</body>
</html>
