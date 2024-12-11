import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
from routes import login, register
import mysql.connector
import hashlib

app = Flask(__name__)

app.secret_key = 'secret_key'

def conexion_bd():
    global mysql, cursor
    mysql = mysql.connector.connect (
        host = 'localhost',
        user = 'root',
        database = 'ConcreteJungle_prueba'
    )
    cursor = mysql.cursor()



@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login')
def login_Ruta():
    return login.login()

@app.route('/register')
def register_ruta():
    return register.register()


if __name__ == '__main__':
    app.run(debug=True, port=4000)