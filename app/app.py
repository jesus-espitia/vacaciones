import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
# from routes import Direciones_de_ruta
import mysql.connector
import hashlib

app = Flask(__name__)

app.secret_key = 'secret_key'

@app.route('/')
def index():
    return render_template('index.html')






if __name__ == '__main__':
    app.run(debug=True, port=4000)