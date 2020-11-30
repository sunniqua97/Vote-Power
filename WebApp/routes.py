from flask import Flask, render_template, flash, request, redirect, url_for
from forms import AddressForm, EmailForm
from sendgrid.helpers.mail import Mail
from sendgrid import SendGridAPIClient
import api
import sys
import os
import logging

app = Flask(__name__)
app.config.from_object('config.Config')
TEMPLATE_ID = 'd-ef7c6f8ef931497fbc98a58c01f398db'
FROM_EMAIL = 'votepowertest@gmail.com'
@app.route('/',methods=['GET','POST'])
def home():
    form = EmailForm()
    if request.method == 'POST':
        address = request.form.get('address')
        full_name = request.form.get('name')
        TO_EMAILS = request.form['recipient']
        message = Mail(from_email = FROM_EMAIL, to_emails = TO_EMAILS)
        message.dynamic_template_data={'full_name': full_name}
        message.template_id = TEMPLATE_ID
        try:
            sg = SendGridAPIClient(os.environ.get('SENDGRID_API_KEY'))
            response = sg.send(message)
            code, body, headers = response.status_code, response.body, response.headers
            print(f"Response code: {code}")
            print(f"Response headers: {headers}")
            print(f"Response body: {body}")
            print("Dynamic Messages Sent!")
        except Exception as e:
            print("Error: {0}".format(e))
        return redirect(url_for('home'))
    return render_template("index.html",form=form)

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
    republican = ""
    democratic = ""
    if form.validate_on_submit():
        try:
            address = request.form.get('address')
            test = api.rep_search(address)
            office =  test['offices']
            official = test['officials']
            republican = "(R)"
            democratic = "(D)"
        except KeyError:
            flash("error")
    return render_template("voteinfo.html",form=form,office=office,official=official,republican=republican,democratic=democratic)

@app.route('/upcomingelections',methods=['GET'])
def upcomingelections():
    electionData = ""
    try:
        test = api.election_search()
        electionData = test['elections']
    except KeyError:
        flash("error")
    return render_template("upcomingelections.html",electionData=electionData)


if __name__ == "__main__":
    app.run(debug=True)
