from google.appengine.ext import db
from google.appengine.ext import webapp
from google.appengine.ext.webapp import util

import jsonrest

def main():
  application = webapp.WSGIApplication([
    # (r'/', Homepage),
    (r'/overview', webHandler.Overview),
    (r'/host/(.*)', webHandler.Host),
  ], debug=True)
  util.run_wsgi_app(application)

class Homepage(webapp.RequestHandler):
  pass

if __name__ == '__main__':
  main()

