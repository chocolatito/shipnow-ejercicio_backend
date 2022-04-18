# Ejercicio Backend Shipnow

---
## Ejecutar la consola
Desde el directorio raíz del proyecto
```sh
ruby consola.rb
``` 

---
## Comandos

```sh
# finalizar la consola
exit
# listar carpetas y archivos de la carpeta actual
ls
# mostrar la ruta de la carpeta actual
whereami
# crear una nueva carpeta
create_folder <name_folder>
# crear un nuevo archivo
create_file <name_file> "<file_content>"
# mostrar el contenido de un archivo
show <name_file>
# mostrar los metadatos de un archivo
metadata <name_file>
# ingresar a una carpeta
cd <name_folder>
# regresar a la carpeta anterior
cd ..
# volver al directorio raíz
cd
```

>__NOTA:__  
Los argumentos `<name_folder>` y `<name_file>` constan de convinaciones de  
- letras mayúsculas y minúsculas
- números
- guiones bajos (`_`) y medios (`-`)  
> El argumento `<file_content>` (que esta dentro de las dobles comillas) puede ser cualquier conbinación de caracteres alfanumericos incluido espacios en blanco.

---
## Lógica del programa
La clase `FileManager` puede entenderse desde la definición de sus atributos.

La clase `FileManager` contine los atributos
- `folders`: Contine toda la informacion de los archivos y carpetas de la ejecución.
- `am_i`: Indica la carpeta actual  

Para entender esta clase, se toman las siguientes dos abstracciones a modo de explicación  
- `<folder_hash>`: es un hash de la forma `{ :<name_folder> => [<folder_hash>, <file_hash>] }`, donde `:<name_folder>` es el nombre de la carpeta y el array `[<folder_hash>, <file_hash>]` representa las carpetas (primera componente) y archivos (segunda componente) de la carpeta referida por `:<key>`
- `<file_hash>`: es un hash de la forma `{ :<name_file> => ObjFile }`, donde `ObjFile` representa una instancia de la clase `File`.


Inicialmente, el atributo `folders` se instancia con `{ :/ => [{}, {}] }`, tal que la clave `:/` indica la carpeta root, mientra que el valor `[{}, {}]` indica que no posee carpetas ni archivos.  
Si se crea una nueva carpeta con el nombre `new_folder`, entonces
```ruby
{
   :/ => [
          {
            :new_folder => [{},{}]
          },
          {}
        ]
}
```

Si, ahora se crea dos nuevos archivos, `new_file_1` y `new_file_1`, tendríamos lo siguiente
```ruby
{
   :/ => [
          {
            :new_folder => [{},{}]
          },
          {
            :new_file_1 => ObjFile,
            :new_file_2 => ObjFile,
          }
        ]
}
```
La clase `ConsolaManager` define los atributos
- `fm`: Un objeto `FileManager`.
- `commands`: Un hash cuyas claves coinciden con los comandos admitidos y cuyos valores, corresponden a un método de la clase `FileManager` a excepcion del método `exit`
- `finish`: Funciona de flag para determinar el fin del método `run`

---
## Tests
1 ) Instalar la gema `rspec` especificada en el archivo `Gemfile`.
```sh
bundle install
```

2 ) Ejecutar los test
```sh
bundle exec rspec
```
