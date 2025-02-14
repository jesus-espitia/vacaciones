import flask_login
from flask import Flask, url_for, redirect, request, render_template, session, jsonify, flash
import mysql.connector
import hashlib


def register():
    return render_template('register.html')

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        documento = request.form['documento']
        correo = request.form['correo']
        contraseña = request.form['password']
        
        # Encriptar la contraseña
        contraseña_encriptada = hashlib.sha256(contraseña.encode()).hexdigest()

        # Insertar usuario en la base de datos
        cursor.execute("INSERT INTO USUARIO (nombres, apellidos, documento, correo, contraseña) VALUES (%s, %s, %s, %s, %s)", 
                        (nombres, apellidos, documento, correo, contraseña_encriptada))
        conn.commit()
        id_usuario = cursor.lastrowid  # Obtener el ID del usuario recién insertado

        # Capturar datos de la primera mascota
        nombreMascota = request.form['nombreMascota']
        tipoMascota = request.form['tipoMascota']
        dniMascota = request.form['dniMascota']

        # Insertar primera mascota
        cursor.execute("INSERT INTO MASCOTAS (idUsuario, nombreMascota, tipoDeMascota, dniMascota) VALUES (%s, %s, %s, %s)", 
                        (id_usuario, nombreMascota, tipoMascota, dniMascota))
        conn.commit()

        # Verificar si hay otra mascota
        otraMascota = request.form.get('otraMascota', 'no')
        if otraMascota == "si":
            nombreMascota2 = request.form.get('nombreMascota2')
            tipoMascota2 = request.form.get('tipoMascota2')
            dniMascota2 = request.form.get('dniMascota2')

            # Insertar segunda mascota si existe
            if nombreMascota2 and tipoMascota2 and dniMascota2:
                cursor.execute("INSERT INTO MASCOTAS (idUsuario, nombreMascota, tipoDeMascota, dniMascota) VALUES (%s, %s, %s, %s)", 
                                (id_usuario, nombreMascota2, tipoMascota2, dniMascota2))
                conn.commit()

        flash("Registro exitoso", "success")
        return redirect(url_for('register_form'))

    except Exception as e:
        conn.rollback()
        flash(f"Error en el registro: {str(e)}", "danger")
        return redirect(url_for('register_form'))

    finally:
        cursor.close()
        conn.close()