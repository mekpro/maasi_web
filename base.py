from google.appengine.ext import db
from google.appengine.ext import webapp
from google.appengine.api import memcache

import logging
import jsonrest
import settings

class Base(webapp.RequestHandler):
  def __init__(self, request=None, response=None):
    self.initialize(request, response)

  def initSession(self):
    session_key = memcache.get('session')
    if session_key is not None:
      self.c = jsonrest.Client(settings.server, session_key)
    else:
      self.redirect('/login')
