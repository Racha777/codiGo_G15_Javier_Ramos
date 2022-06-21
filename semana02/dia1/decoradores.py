def decorador(func):
    def envoltura():
        print('esto se añade a la funcion principal')
        func()
    return envoltura

def mayusculas(func):
    def envoltura(texto):
        return func(texto).upper()
    return envoltura

@decorador
def mensaje():
    print('hola mundo')

#mensaje=decorador(mensaje)
mensaje()

@mayusculas
def mostrarTexto(texto):
    return 'texto: '+texto

print(mostrarTexto('javier'))