from flask import Flask, redirect, url_for, render_template, request, make_response
import mysql.connector

app = Flask(__name__)

mydb = mysql.connector.connect(
    host="locahost",
    user="root",
    password="Abcd@1234",
    database="angusshop"
)
dbcursor = mydb.cursor()

@app.route("/")
@app.route("/home")
def home():
    return render_template("main.html")