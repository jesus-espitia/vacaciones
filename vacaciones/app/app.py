import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
from routes import miembros, login, inicio, logining, perfil, grupos, amigos_chat
import mysql.connector
import hashlib