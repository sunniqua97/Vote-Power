from flask import Flask, render_template, flash, request, redirect
from forms import AddressForm
import api
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
    origin = ""
    destination = ""
    if form.validate_on_submit():
        address = request.form.get('address')
        origin = address
        destination = api.poll_search(address)
        # print(origin)
        # print(destination)
    return render_template("pollsite.html",form=form,origin=origin,destination=destination)

@app.route('/voteinfo',methods=['GET'])
def voteinfo():
    return render_template("voteinfo.html")

@app.route('/upcomingelections',methods=['GET'])
def upcomingelections():
    return render_template("upcomingelections.html")

if __name__ == "__main__":
    app.run(debug=True)
