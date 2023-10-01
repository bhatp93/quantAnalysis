from flask import Flask, request
import renkoMacd
app = Flask(__name__)

@app.route("/")
def hello_world():
    print("received request")
    return "<p>Hello, World!</p>"

@app.route('/json_example', methods=['POST'])
def handle_json():
    data = request.json
    tickers = data.get('stocks')
    for ticker in tickers:
        print(ticker)
    #print(data.get('name'))
    #print(data.get('age'))
    renkoMacd.calculate(tickers)
    return data