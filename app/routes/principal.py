import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
import mysql.connector
import hashlib


def principal():
    return render_template('principal.html')