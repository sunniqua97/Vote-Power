from flask import Flask, render_template, flash, request, redirect
from forms import AddressForm
from api import poll_search
import sys
import os
import logging

app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(24)

@app.route('/',methods=['GET'])
def home():
    return render_template("index.html")

@app.route('/registration',methods=['GET'])
def registration():
    return render_template("registration.html")

@app.route('/pollsite',methods=['GET','POST'])
def pollsite():
    form = AddressForm()
    if form.validate_on_submit():
        address = request.form['address']
        data = poll_search(address)
    return render_template("pollsite.html",form=form)

@app.route('/voteinfo',methods=['GET'])
def voteinfo():
    return render_template("voteinfo.html")

@app.route('/upcomingelections',methods=['GET'])
def upcomingelections():
    return render_template("upcomingelections.html")

if __name__ == "__main__":
    app.run(debug=True)
