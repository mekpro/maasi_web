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
      margin: 12px auto;
      float: left;
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
          <li class="active"><a href="/overview">Overview</a></li>
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
          {% for hostgroup in hosttree.iteritems %}
            <li><b>{{hostgroup.0}} </b></li>
            <ul>
            {% for host in hostgroup.1%}
              <li><a href='/host/{{hostgroup.0}}__{{host}}'>{{host}}</a></li>
            {% endfor %}
            </ul>
          {% endfor %}
        </ul>
      </div>
      <div class="span9">
        <h1>{{hostname}}</h1>
          <ul>
            <li>Last Updated: {{last_update}} </li>
          </ul>
          {% for module in data.items %}
            <h3>{{module.0}} </h3>
            {% for metric in module.1.items %}
              <div class="graph" id={{module.0}}{{metric.0}}></div>
              <script>
                f = document.getElementById('{{module.0}}{{metric.0}}')
                graph = Flotr.draw(f, [{{metric.1}}],
                  {title: '{{metric.0}}' });
              </script>
            {% endfor %}
            <div style="clear:both"></div>
          {% endfor %}
        </h3>
      </div>
    </div>
  </div>
</body>
</html>
