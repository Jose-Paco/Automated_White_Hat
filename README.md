# Automated_White_Hat
M14project
<!-- This content will not appear in the rendered Markdown -->

## Como ejecutar el Script

Se ejecuta mediante "sh menuprincipal.sh", a continuación nos aparecerá un mensaje que nos solicitará la URL, dicha URL deberá ser enviada acorde con los parametros que aparecen más abajo para augmentar posibilidades de exito, aunque no es obligatorio y puede funcionar de todos modos.

En caso de aparecer un mensaje de error normalmente nos permitirá volver a empezar el proceso.

Despues de esto si todos los datos son correctos script dispone de un menú que nos dirá a que es vulnerable la web. Ahora podremos cerrar el  script o realizar una Proof of Concept.

### Reflected XSS
#### Como Funciona

Requiere de una URL con una barra de busqueda, podemos encontrar webs de este estilo en buscadores, diccionarios, foros, tiendas online...

La URL a utilizar es la que aparece despues de hacer una busqueda.

[Échale un vistazo al código](https://github.com/Jose-Paco/Automated_White_Hat/blob/ataques/xss.sh)

### SQL Injection
#### Como Funciona

Requiere de una URL con filtros por categorias, por ejemplo la URL de una tienda online.

[Échale un vistazo al código](https://github.com/Jose-Paco/Automated_White_Hat/blob/ataques/sqli.sh)

### Ataque de diccionario
#### Como Funciona
Primero de todo debes buscar una web con una pestaña de autentificación, una vez aqui, copiar la URL e insertarla en 

[Échale un vistazo al código](https://github.com/Jose-Paco/Automated_White_Hat/blob/ataques/diccionario.sh)

Para ejecutar el ataque de diccionario tanto los ficheros de contraseñas como los de usuarios, requieren estar creados con un registro por linea.
