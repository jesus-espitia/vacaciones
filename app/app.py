import flask_login
from flask import Flask, url_for, redirect, request, session, jsonify, flash
from routes import index, principal, login, register
import mysql.connector
import hashlib

app = Flask(__name__)

app.secret_key = 'secret_key'

def conexion_bd():
    global mysql, cursor
    mysql = mysql.connector.connect (
        host = 'localhost',
        user = 'root',
        database = 'concrete_jungle'
    )
    cursor = mysql.cursor()

#==============================================================================================================
@app.route('/')
def index_Ruta():
    return index.index()

#==============================================================================================================
@app.route('/principal')
def pricipal_Ruta():
    return principal.principal()

#==============================================================================================================
@app.route('/login')
def login_Ruta():
    return login.login()

#==============================================================================================================
@app.route('/register', methods=['GET','POST'])
def register_ruta():
    return register.register()


#==============================================================================================================
if __name__ == '__main__':
    app.run(debug=True, port=4000)