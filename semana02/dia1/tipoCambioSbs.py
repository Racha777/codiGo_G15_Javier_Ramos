from unittest import result
import requests
from bs4 import BeautifulSoup
from tabulate import tabulate

class TipoCambioSbs:
    def __init__(self):
        self.url=requests.get('https://www.sbs.gob.pe/app/pp/SISTIP_PORTAL/Paginas/Publicacion/TipoCambioPromedio.aspx')

    def obtenerTipoCambio(self):
        resultado=''
        if(self.url.status_code==200):
            html=BeautifulSoup(self.url.text,'html.parser')
            listaMonedas=[]
            for i in range(7):
                fila=html.find('tr',{'id':'ctl00_cphContent_rgTipoCambio_ctl00__'+str(i)})
                moneda=fila.find('td',{'class':'APLI_fila3'})
                cambio_valores=fila.find_all('td',{'class':'APLI_fila2'})
                compra=cambio_valores[0]
                venta=cambio_valores[1]
                dictMoneda={
                    'moneda':moneda.get_text(),
                    'compra':compra.get_text(),
                    'venta':venta.get_text()
                }
                listaMonedas.append(dictMoneda)

            columnas=['moneda','compra','venta']
            tablaMonedas=[moneda.values() for moneda in listaMonedas]
            resultado=tabulate(tablaMonedas,headers=columnas,tablefmt="html")
        
        else:
            resultado='error : '+str(self.url.status_code)
    
        return resultado