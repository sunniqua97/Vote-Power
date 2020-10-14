import requests
import pprint
import json
import os
from dotenv import load_dotenv
from flask import flash

# get a key here https://console.developers.google.com/apis/credentials
key = os.getenv('CIVICS_API_KEY')

# Google Civics VoterInfoQuery API to get pollsite location
def poll_search(address):
    address.replace('+','%20')
    # call api
    full_url = 'https://civicinfo.googleapis.com/civicinfo/v2/voterinfo?address=' + address + '&key=' + key
    req = requests.get(full_url)
    data = req.json()
    try:
        # GCivic poll location information
        location_name = data['pollingLocations'][0]['address']['locationName']
        location_address = data['pollingLocations'][0]['address']['line1']
        location_city = data['pollingLocations'][0]['address']['city']
        location_state = data['pollingLocations'][0]['address']['state']
        location_zip = data['pollingLocations'][0]['address']['zip']
        full_location = location_address + ', ' + location_city + ', ' + location_state + ', ' + location_zip
        # polling hours
        polling_hours = data['pollingLocations'][0]['pollingHours']
        flash(location_name)
        flash(full_location)
        flash(polling_hours)
    # Keyerror for polling location
    except KeyError:
        flash("Sorry, we couldn't find a poll location for the address you've entered.")
    return data
