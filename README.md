# README

 Es una aplicación desarrollada con Ruby on Rails  como trabajo integrador de la materia Taller de Tecnologías de producción de Software de la Universidad Nacional de La Plata.
 
## Requerimientos

* Ruby version:  2.4.1
* Bundler 
* Rails 5.1.4 
## ¿Cómo instalo la aplicación?
### Descargar código fuente:
* [Repositorio Github] (https://github.com/ezemanzur/TPI-Ruby2017)
* O desde la consola:

```bash
  $ git clone https://github.com/ezemanzur/TPI-Ruby2017
  ```

### Gemas:
```bash
	$ bundle install
```
	  * Para este último comando, se debe estar ubicado sobre el directorio donde se copió el repositorio.

### Preparar base de datos:
```bash
	$ rails db:create
	$ rails db:migrate
```
	 * La aplicación provee de datos pre-cargados (seeds) para poder probar el software sin necesidad de tener que cargar numerosas entradas.
```bash
	$ rails db:seed
```
### Ejecutar web server
*Para iniciar el web server:
```bash
  $ rails s
```

### ¡Listo!
Para acceder:
[http://localhost:3000](http://localhost:3000)

# Unit Test
Puedes correr los Unit Test para esta aplicación.
* Todos los test:
```bash
  $ rails test test/
 ```
* Para el modelo de Cursos:
```bash
  $ rails test test/models/course_test.rb
 ```
* Para el modelo de Evaluaciones:
```bash
  $ rails test test/models/evaluation_test.rb
 ```
* Para el modelo de Estudiantes:
```bash
  $ rails test test/models/student_test.rb
 ```
* Para el modelo de Notas:
```bash
  $ rails test test/models/grade_test.rb
 ```
* Controller Cursos
```bash
  $ rails test test/controllers/coursescontroller_test.rb
 ```
* Controller Evaluaciones
```bash
  $ rails test test/controllers/evaluations_controller_test.rb
 ```
* Controller Estudiantes	
```bash
  $ rails test test/controllers/students_controller_test.rb
 ```
* Para iniciar sesion en la app (Usuario pre-cargado)
	email: admin@admin.com password: '1234567'
