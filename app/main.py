from flask import Flask, jsonify
import socket

app = Flask(__name__)


@app.route("/hello")
def read_hello():
    hostname = socket.gethostname()
    return jsonify({"message": f"Hello from {hostname}"})


if __name__ == "__main__":
    app.run(debug=True, port=8080, host="0.0.0.0")
