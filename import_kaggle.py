import json
import zipfile
import os

api_token={"username": "rafaelolivares200992", "key": "96aff0d57a6f2c22931eafc4dbe31cb9"}

##Conectar a kaggle

with open("C:/Users/Rafo/.kaggle/kaggle.json","w") as file:
    json.dump(api_token,file)

location="C:/Users/Rafo/proyecto_parcial_ops/dataset"

##Validar si la carpeta existe
if not os.path.exists(location):
    ##Si no existe la carpeta dataset entonces la creo
    os.mkdir(location)
else:
    ##Si la carpeta si existe, entonces voy a borrar su contenido
    for root, dirs, files in os.walk(location,topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) ##elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) ##elimino todas las carpetas

##Descargar dataset de kaggle
os.system("kaggle datasets download -d henryshan/Starbucks -p C:/Users/Rafo/proyecto_parcial_ops/dataset")

##Descomprimir el archivo kaggle
os.chdir(location)
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file,"r") ##lee archivo .zip
    zip_ref.extractall() ##extrae contenido de archivo .zip
    zip_ref.close() ##cierra archivo