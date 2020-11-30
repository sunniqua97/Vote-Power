from flask import Flask, render_template, flash, request, redirect, url_for
from forms import AddressForm, EmailForm
from flask_mail import Mail, Message
import api
import sys
import os
import logging

app = Flask(__name__)
app.config.from_object('config.Config')
app.config['SECRET_KEY'] = 'top-secret!'
app.config['MAIL_SERVER'] = 'smtp.sendgrid.net'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'apikey'
app.config['MAIL_PASSWORD'] = os.environ.get('SENDGRID_API_KEY')
app.config['MAIL_DEFAULT_SENDER'] = os.environ.get('MAIL_DEFAULT_SENDER')
mail = Mail(app)

@app.route('/',methods=['GET','POST'])
def home():
    form = EmailForm()
    if request.method == 'POST':
        address = request.form.get('address')
        recipient = request.form['recipient']
        msg = Message('Twilio SendGrid Test Email', recipients=[recipient])
        msg.body = ('Congratulations! You have sent a test email with '
                    'Twilio SendGrid!')
        msg.html = "footer.html"
        mail.send(msg)
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
