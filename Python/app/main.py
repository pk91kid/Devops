from flask import Flask
app = Flask(__name__)
@app.route('/')
def msg():
    return "Hello world! Deployed using ArgoCD!"
if __name__ == "__main__":
    app.run(host='0.0.0.0')
