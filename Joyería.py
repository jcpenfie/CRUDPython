import bottle
import pymongo
from bottle import request, post
from bson.objectid import ObjectId

# Acceso a la base de datos
con = pymongo.MongoClient("localhost", 27017)
db = con.Joyeria

# Login para acceder a la lista de joyas


@bottle.route('/')
def raiz():
    return bottle.template("login")

# Valida que el empleado exista


@post('/validaUsuario')
def validaUsuario():
    dni = request.forms.get('dni')
    item = list(db.Trabajadores.find({"dni": dni}))
    if len(item) != 0:
        return bottle.redirect("/joyas")
    else:
        return bottle.redirect("/")

# Listar todas las joyas


@bottle.route('/joyas')
def joyas():
    item = db.Joyas.find()
    return bottle.template("listaJoyas", joyas=item)

# Añadir Joya


@post('/insert')
def sumar():
    id = request.forms.get("id")
    nombre = request.forms.get("nombre")
    descripcion = request.forms.get("descripcion")
    estado = request.forms.get("estado")
    precio = request.forms.get("precio")
    cantidadStock = request.forms.get("stock")
    item = list(db.Joyas.find({"id": id}))
    if len(item) == 0:
        db.Joyas.insert_one({"id": id, "nombre": nombre, "descripcion": descripcion, "estado": estado, "precio": precio, "cantidadStock": cantidadStock})

    return bottle.redirect("/joyas")

# Eliminar joya


@bottle.route('/delete/<id>')
def eliminar(id):
    db.Joyas.delete_one({"_id": ObjectId(id)})

    return bottle.redirect("/joyas")

# Editar joya


@bottle.route('/edit/<id>')
def editar(id):
    item = list(db.Joyas.find({"_id": ObjectId(id)}))

    return bottle.template("edit", Joyas = item)
# Actualizar joya


@post('/update')
def guardar():
    id = request.forms.get("id")
    nombre = request.forms.get("nombre")
    descripcion = request.forms.get("descripcion")
    estado = request.forms.get("estado")
    precio = request.forms.get("precio")    
    cantidadStock = request.forms.get("stock")

    filter = {"_id": ObjectId(id)}
    actualiza = {"$set": {"nombre": nombre, "descripcion": descripcion, "estado": estado, "precio": precio, "cantidadStock": cantidadStock}}
    db.Joyas.update_one(filter, actualiza)
    return bottle.redirect("/joyas")


bottle.debug(True)
bottle.run(host='localhost', port=8082)
