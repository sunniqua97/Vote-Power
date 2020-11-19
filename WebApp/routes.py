from flask import Flask, render_template, flash, request, redirect
from forms import AddressForm
import api
import sys
import os
import logging

app = Flask(__name__)
app.config.from_object('config.Config')

@app.route('/',methods=['GET'])
def home():
    return render_template("index.html")

@app.route('/registration',methods=['GET'])
def registration():
    test = api.states()
    state = test['states']
    return render_template("registration.html",state=state)

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

@app.route('/voteinfo',methods=['GET','POST'])
def voteinfo():
    form = AddressForm()
    test = ""
    office = ""
    official = ""
    if form.validate_on_submit():
        try:
            address = request.form.get('address')
            test = api.rep_search(address)
            office =  test['offices']
            official = test['officials']
        except KeyError:
            flash("error")
    return render_template("voteinfo.html",form=form,office=office,official=official)

@app.route('/upcomingelections',methods=['GET'])
def upcomingelections():
    try:
        test = api.election_search()
        electionData = test['elections']
    except KeyError:
        flash("error")
    return render_template("upcomingelections.html",electionData=electionData)

if __name__ == "__main__":
    app.run(debug=True)
