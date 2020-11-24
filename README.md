# VotePower


## Table of Contents
* [About the Project](#about-the-project)
	* [Built With](#built-with)
* [Getting Started](#getting-started)
	* [Prerequisites](#prerequisites)
	* [Installation](#installation)
	* [Running Flask](#running-flask)
	

## About the Project
VotePower is an all in one voter information application that aims to eliminate the hassle in finding out where and when to vote for local/federal elections by providing users a seamless interface to plan accordingly.


### Built With
* [Bootstrap](https://getbootstrap.com/)

* [Flask](https://flask.palletsprojects.com/en/1.1.x/installation/#installation)


## Getting Started

### Prerequisites
* Git clone this repository 
```
git clone https://github.com/J-sonLi/Vote-Power.git
```
* Install the latest version of [Python](https://www.python.org/downloads/)

* Get [Google API Keys](https://console.developers.google.com/apis/library)  and enable the following APIs
	 - Google Civic Information API
	 - Maps JavaScript API
	 - Geocoding API
	 - Directions API
	 - Places API

### Installation
Install virtualenv
```
$ pip3 install virtualenv
```
Activate the Virtual Environment

For Linux/Mac:
```
$ virtualenv venv
$ source venv/bin/activate
```
For Windows:
```
$ virtualenv venv
$ venv\Scripts\activate
```
Install necessary packages:
```
$ pip3 install -r requirements.txt
```
### Running Flask
For Linux/Mac:
```
$ export FLASK_APP=routes.py
$ flask run
```
For Windows:
```
$ set FLASK_APP=routes.py
$ flask run
```



