import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
# from routes import Direciones_de_ruta
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






if __name__ == '__main__':
    app.run(debug=True, port=4000)