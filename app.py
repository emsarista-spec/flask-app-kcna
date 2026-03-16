from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify(message="Hello from Flask on Kubernetes!")

@app.route("/health")
def health():
    return jsonify(status="ok"), 200

@app.route("/echo", methods=["POST"])
def echo():
    data = request.get_json(force=True, silent=True) or {}
    return jsonify(echo=data)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=4567)
