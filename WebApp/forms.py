from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired

# Form for address
class AddressForm(FlaskForm):
    address = StringField('Address',validators=[DataRequired()],render_kw = {"placeholder": "123 Main St, Brooklyn, NY 11330"})
    submit = SubmitField('Submit')
