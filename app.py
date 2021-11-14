from flask import Flask, redirect, url_for, render_template, request, make_response
import mysql.connector

app = Flask(__name__)

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
    return render_template("main.html")

if __name__ == "__main__":
    app.run(debug=True)