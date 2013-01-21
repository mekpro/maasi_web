import os
from google.appengine.ext.webapp import template
from google.appengine.ext import db
from google.appengine.ext import webapp
from django.utils import simplejson

import datetime
import logging
import settings

import jsonrest

class Overview(webapp.RequestHandler):
  def get(self):
    tpv = dict()
    c = jsonrest.Client(settings.server)
    hostlist = c.request("get",{})
    host_load = []
    for hostname in hostlist:
      loadavg = c.request("get/%s/loadavg/load1m" %hostname, {})
      host_load.append((hostname, loadavg))

    tpv = {
      'hostlist' : hostlist,
      'host_load' : host_load,
    }
    path = os.path.join(os.path.dirname(__file__), 'templates/overview.tpl')
    self.response.out.write(template.render(path, tpv))

class Host(webapp.RequestHandler):
  def get(self, hostname):
    tpv = dict()
    c = jsonrest.Client(settings.server)
    hostlist = c.request("get",{})
    # TODO: check host exists
    data = dict()
    modules =  c.request("get/%s" %hostname, {})
    for module in modules:
      data[module] = dict()
      metrics = c.request("get/%s/%s" %(hostname, module), {})
      for metric in metrics:
        value = c.request("get/%s/%s/%s" %(hostname, module, metric), {"datatype":"range"})
        data[module][metric] = value

    tpv = {
      'hostlist' : hostlist,
      'data' : data,
    }
    logging.info(data)
    path = os.path.join(os.path.dirname(__file__), 'templates/host.tpl')
    self.response.out.write(template.render(path, tpv))
