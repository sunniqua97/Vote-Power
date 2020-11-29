from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired, EqualTo, Email

# Form for address
class AddressForm(FlaskForm):
    address = StringField('Address',validators=[DataRequired()])
    submit = SubmitField('Submit')


# Form for email notifications

class EmailForm(FlaskForm):
    fullName = StringField('Full Name',validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    submit = SubmitField('Sign Up')
