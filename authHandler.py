import os
from google.appengine.ext.webapp import template
from google.appengine.ext import webapp
from google.appengine.api import memcache

import logging
import settings
import jsonrest

class Login(webapp.RequestHandler):
  def get(self):
    path = os.path.join(os.path.dirname(__file__), 'templates/login.tpl')
    self.response.out.write(template.render(path, {} ))

  def post(self):
    params = dict()
    params["username"] = self.request.get('username')
    params["password"] = self.request.get('password')
    c = jsonrest.Client(settings.server)
    session_key = c.request('authen/get_current_session_key', params)
    if session_key != '-1':
      memcache.add('session', session_key)
      logging.info(session_key)
      self.redirect('/overview')
    else:
      self.redirect('/login')

class Logout(webapp.RequestHandler):
  def get(self):
    memcache.flush_all()
    self.redirect('/login')
