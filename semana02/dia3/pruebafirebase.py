import firebase_admin
from firebase_admin import credentials

cred=credentials.Certificate("token.json")
firebase_admin.initialize_app(cred)

from firebase_admin import firestore

db=firestore.client()

colProyectos=db.collection('proyectos')
docProyectos=colProyectos.get()

for doc in docProyectos:
    print(doc.to_dict())