from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b"""
        <html>
          <body style="font-family:sans-serif; text-align:center; padding:50px; background:#5B2D8E; color:white;">
            <h1>Hello World!</h1>
            <p>Containerized app by Ray — She Code Africa AWS Class</p>
          </body>
        </html>
        """)

HTTPServer(('0.0.0.0', 8080), Handler).serve_forever()