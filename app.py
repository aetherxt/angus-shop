from flask import Flask, redirect, url_for, render_template, request, make_response
import mysql.connector

from fetchsqldb import fetchdata
from signup import submitsignup

app = Flask(__name__)
app.secret_key = 'angus'

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Abcd@1234",
    database="school"
)
mycursor = mydb.cursor()

@app.route("/")
@app.route("/home")
def home():
    result = fetchdata("angusshop", "product")
    return render_template("main.html", product = result)

@app.route("/signup")
def signup():
    return render_template("signup.html")

@app.route("/signin")
def signin():
    return render_template("signin.html")

@app.route("/submit", methods=["POST"])
def submit():
    
    submitsignup("angusshop", "user")
    return redirect(url_for("signup"))

if __name__ == "__main__":
    app.run(debug=True)