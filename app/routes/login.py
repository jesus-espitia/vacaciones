import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
import mysql.connector
import hashlib

def login():
    return render_template('login.html')