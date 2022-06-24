from flask import Flask, render_template,redirect,url_for,session,flash

from . import admin
from .forms import LoginForm

import pyrebase
from app.firebaseConfig import firebaseConfig

firebase=pyrebase.initialize_app(firebaseConfig)
auth=firebase.auth()

@admin.route('/')
def index():
    if('token' in session):
        return render_template('admin/index.html')
    else:
        return redirect(url_for('admin.login'))

@admin.route('/login',methods=['GET','POST'])
def login():
    login_form=LoginForm()
    context={
        'login_form':login_form
    }
    if login_form.validate_on_submit():
        #Realizar el login de usuarios
        usuariosData=login_form.usuario.data
        passwordData=login_form.password.data
        try:
            usuario=auth.sign_in_with_email_and_password(usuariosData,passwordData)
            dataUsuarioValido=auth.get_account_info(usuario['idToken'])
            print(dataUsuarioValido)
            session['token']=usuario['idToken']
            return redirect(url_for('admin.index'))
        except:
            print('error al autenticarse')
            flash("Usuario o password invalidos")

    return render_template('admin/login.html',**context)

@admin.route('/logout')
def logout():
    session.pop('token')
    return redirect(url_for('admin.login'))