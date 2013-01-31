from google.appengine.ext import db
from google.appengine.ext import webapp
from google.appengine.ext.webapp import util
from google.appengine.ext.webapp import template

import jsonrest
import settings
import webHandler
import authHandler
import time

def main():
  application = webapp.WSGIApplication([
    # (r'/', Homepage),
    (r'/login', authHandler.Login),
    (r'/logout', authHandler.Logout),
    (r'/overview', webHandler.Overview),
    (r'/host/(.*)', webHandler.Host),
    # Benchmark utils
    (r'/bench_latency', BenchLatency),
  ], debug=True)
  util.run_wsgi_app(application)

class BenchLatency(webapp.RequestHandler):
  def get(self):
    c = jsonrest.Client(settings.server)
    t1 = time.time()
    c.request('/admin/noop', {})
    t = time.time() - t1
    self.response.out.write(t)

class Homepage(webapp.RequestHandler):
  pass

if __name__ == '__main__':
  main()
