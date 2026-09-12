from flask import Flask, send_from_directory
import os

app = Flask(__name__, static_folder='.')

@app.route('/')
def serve_index():
    # यह Vercel को सीधा आपकी मुख्य HTML फ़ाइल पर भेज देगा
    return send_from_directory('.', 'index.html')

if __name__ == '__main__':
    app.run(debug=True)
