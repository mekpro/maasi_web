import os
from google.appengine.ext.webapp import template
from google.appengine.ext import db
from google.appengine.ext import webapp
from django.utils import simplejson

import datetime
import logging
import settings

import base
import jsonrest

def genHostTree(hostlist):
  r = dict()
  for host in hostlist:
    p = host.split("__")
    r[p[0]] = list()
  for host in hostlist:
    p = host.split("__")
    if len(p) > 1:
      r[p[0]].append(p[1])
  return r

class Overview(base.Base):
  def get(self):
    tpv = dict()
    self.initSession()
    hostlist = self.c.request("get",{})
    hosttree = genHostTree(hostlist)
    host_load = []
    for hostname in hostlist:
      loadavg = self.c.request("get/%s/loadavg/load1m" %hostname, {})
      host_load.append((hostname, loadavg))

    tpv = {
      'hosttree' : hosttree,
      'hostlist' : hostlist,
      'host_load' : host_load,
    }
    path = os.path.join(os.path.dirname(__file__), 'templates/overview.tpl')
    self.response.out.write(template.render(path, tpv))

class Host(base.Base):
  def get(self, hostname):
    self.initSession()
    tpv = dict()
    hostlist = self.c.request("get",{})
    hosttree = genHostTree(hostlist)
    # TODO: check host exists
    data = dict()
    modules =  self.c.request("get/%s" %hostname, {})
    for module in modules:
      data[module] = dict()
      metrics = self.c.request("get/%s/%s" %(hostname, module), {})
      for metric in metrics:
        value = self.c.request("get/%s/%s/%s" %(hostname, module, metric), {"datatype":"range"})
        data[module][metric] = value

    tpv = {
      'hostname' : hostname,
      'hosttree' : hosttree,
      'hostlist' : hostlist,
      'data' : data,
    }
    logging.info(data)
    path = os.path.join(os.path.dirname(__file__), 'templates/host.tpl')
    self.response.out.write(template.render(path, tpv))

class HostGetAll(base.Base):
  def get(self, hostname):
    self.initSession()
    tpv = dict()
    hostlist = self.c.request("get",{})
    hosttree = genHostTree(hostlist)
    data = self.c.request("getall/%s" %hostname, {"datatype":"range"})

    tpv = {
      'hostname' : hostname,
      'hosttree' : hosttree,
      'hostlist' : hostlist,
      'data' : data,
    }
    logging.info(data)
    path = os.path.join(os.path.dirname(__file__), 'templates/host.tpl')
    self.response.out.write(template.render(path, tpv))


