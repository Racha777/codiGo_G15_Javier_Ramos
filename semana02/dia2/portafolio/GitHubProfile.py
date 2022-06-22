import requests

class GitHubProfile:
    def __init__(self):
        self.url_base='https://api.github.com/users/Racha777'
        dataPerfil=requests.get(self.url_base).json()
        self.nombre=dataPerfil['name']
        self.biografia=dataPerfil['bio']
        self.imagen=dataPerfil['avatar_url']
        self.ubicacion=dataPerfil['location']
        self.twitter=dataPerfil['twitter_username']
        self.github=dataPerfil['html_url']

    def obtenerRepositorios(self,cantidad):
        urlRepositorios=self.url_base+'/repos'
        dataRepositorios=requests.get(urlRepositorios).json()
        listaRepositorios=[]
        contador=0
        for repo in dataRepositorios:
            if contador<=cantidad:
                dictRepositorio={
                    'nombre':repo['name'],
                    'url':repo['html_url'],
                    'descripcion':repo['description']
                }
                listaRepositorios.append(dictRepositorio)
            else:
                break
        return listaRepositorios