from flask import Flask, render_template
from forms import AddressForm
import os

app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(24)

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/registration')
def registration():
    return render_template("registration.html")

@app.route('/pollsite')
def pollsite():
    form = AddressForm()
    return render_template("pollsite.html",form=form)

@app.route('/voteinfo')
def voteinfo():
    return render_template("voteinfo.html")

@app.route('/upcomingelections')
def upcomingelections():
    return render_template("upcomingelections.html")

if __name__ == "__main__":
    app.run(debug=True)
