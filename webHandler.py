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
    for host in hostlist:
      loadavg = c.request("get/%s/loadavg/load1m" %host, {})
      host_load.append((host, loadavg))

    tpv = {
      'hostlist' : hostlist,
      'host_load' : host_load,
    }
    path = os.path.join(os.path.dirname(__file__), 'templates/overview.tpl')
    self.response.out.write(template.render(path, tpv))

class Host(webapp.RequestHandler):
  def get(self):
    tpv = dict()

    tpv = {
      'hostlist' : hostlist,
      'host_load' : host_load,
    }
    path = os.path.join(os.path.dirname(__file__), 'templates/host.tpl')
    self.response.out.write(template.render(path, tpv))
