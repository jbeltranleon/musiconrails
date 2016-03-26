#Rails es una gema de ruby

$ rails 
#para ver todas las opciones de comando de rails

$ rails new nombre_del_proyecto

# #en mi caso no olvidar agregar
# gem 'therubyracer'
# gem 'execjs'
# al archivo de Gemfile


$ bundle install
#ejecutar el comando para instalar las 
#dependencias necesarias

$ rails server #o $ rails s
#levanta el servidor de apps web que corre
#ruby on rails 
#Para cerrarlo usamos ctrl+shift+c

#para ver las apps web vamos a
#localhost:3000

#rails se basa en mvc

#generadores de componentes de la aplicacion
$rails generate
#para desarrollar controladores, helpers, pruebas de integracion
$ rails generate scaffold track title:string album:string artist:string
#escaffold es una tecnica en donde le damos a nuestra
#aplicacion ciertos detalles de como vamos a utilizar }
#nuestra bases de datos, scaffolds va a inferir
#como se van a llamar los modelos, rutas y vistas
#scaffold espera:
#nombre del modelo (track, recuerda escribir los modelos en ingles y en singular)
#despues van los atributos y el tipo de el atributo (title:string album:string artist:string)

$ rake db:migrate
#para hacer las migraciones
#las migraciones son una forma para poder trabajar nuestra
#base de datos, maneja los esquemas con ruby, le indica a la base da datos
#las acciones que debe realizar

$ rake routes
#la forma en la que interactuamos con nuestros modelos
#es a traves de las rutas
#para ver las rutas 

# las rutas en nuestra aplicacion
#para manipular y crear objetos de tipo cancion (track)
#son:
rake routes
    Prefix Verb   URI Pattern                Controller#Action
    tracks GET    /tracks(.:format)          tracks#index
    #para ver las canciones (por ejemplo)       
           POST   /tracks(.:format)          tracks#create
 new_track GET    /tracks/new(.:format)      tracks#new
edit_track GET    /tracks/:id/edit(.:format) tracks#edit
     #esto nos envia al controlador de tracks edit
     track GET    /tracks/:id(.:format)      tracks#show
    #esta ruta que soporta un id (identificador) nos envia a show
           PATCH  /tracks/:id(.:format)      tracks#update
           PUT    /tracks/:id(.:format)      tracks#update
           DELETE /tracks/:id(.:format)      tracks#destroy

#Los alias de los prefijos como tracks GET los vamos a usar mas adelante
#para generar enlaces a esas rutas

#los verbos de http son los usamos para interactuar con
#con los servidores de http, podemos hacer peticiones de
#tipo GET, POST, PUT...

#cuando vamos a /tracks(.:format) esa ruta corresponde a una accion de nuestro controlador.
#tracks#index en este caso es la accion del controlador
#ahora vamos a controllers/concerns/tracks_controller.rb

#El MVC en rails

#peticion a la ruta
#de la ruta al controlador
#el controlador tiene una funcion que se encarga de manipular los modelos
#delega a la vista la responsabilidad de mostrar la informacion al usuario

#si vemos en terminal cuando levantamos el server, podemos ver al ir a edit

Started GET "/tracks/1/edit" for 127.0.0.1 at 2016-03-17 15:41:52 -0500
Processing by TracksController#edit as HTML
  Parameters: {"id"=>"1"}#esto es un hash
  #vemos que recibe parametros vamos a app/controlers/concerns/tracks_controller.rb
  Track Load (0.4ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."id" = ? LIMIT 1  [["id", 1]]
  Rendered tracks/_form.html.erb (3.2ms)
  Rendered tracks/edit.html.erb within layouts/application (9.7ms)
Completed 200 OK in 82ms (Views: 77.7ms | ActiveRecord: 0.4ms)



#los modelos tienen los componentes que forman nuestro sistema

#ActiveRecord es: una capa que se encarga de que nosotros podamos conectar
#nuestra app directamente con la base de datos.
#en vez de trabajar directamente con el codigo de sql para hacer consultas y extraer la informacion
#nos ofrece que lo hagamos mediante objetos y metodos de esos objetos

#ActiveREcords no hace la vida mas "sencilla"

#Esto lo podemos ver cuando volvemos a la vista principal

Started GET "/tracks" for 127.0.0.1 at 2016-03-17 16:01:53 -0500
#en este caso no le estamos pasando ningun parametro
Processing by TracksController#index as HTML
  Track Load (0.5ms)  SELECT "tracks".* FROM "tracks"
  #esto es lo que hace ActiveRecords (en este caso genera una consulta de sql)
  Rendered tracks/index.html.erb within layouts/application (3.7ms)
Completed 200 OK in 55ms (Views: 53.8ms | ActiveRecord: 0.5ms)

#esto pasa cuando editamos un track

Started PATCH "/tracks/2" for 127.0.0.1 at 2016-03-17 22:50:09 -0500
#peticion de tipo patch
Processing by TracksController#update as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"PoNJI69m3BlSPBQ0nrNB6LnLHS34KlfhDByar32ukIQF9HH81Bbcv98/a76aBu9DUuvLWT3QUY9wOJCakoeanw==", "track"=>{"title"=>"Milonga del trovador", "album"=>"Andres-Obras Completas", "artist"=>"Andres Calamaro"}, "commit"=>"Update Track", "id"=>"2"}
  #el token de autenticidad es para seguridad, para evitar alteraciones maliciosas                                                              #aca vemos los valores que estamo editando                                                                #acá lo agrega e indica como lo edita, vamos a tracks_controller
  Track Load (1.8ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."id" = ? LIMIT 1  [["id", 2]]
   
   (0.1ms)  begin transaction
  SQL (2.0ms)  UPDATE "tracks" SET "title" = ?, "album" = ?, "artist" = ?, "updated_at" = ? WHERE "tracks"."id" = ?  [["title", "Milonga del trovador"], ["album", "Andres-Obras Completas"], ["artist", "Andres Calamaro"], ["updated_at", "2016-03-18 03:50:10.013304"], ["id", 2]]
   (175.1ms)  commit transaction
Redirected to http://localhost:3000/tracks/2
Completed 302 Found in 190ms (ActiveRecord: 179.0ms)


Started GET "/tracks/2" for 127.0.0.1 at 2016-03-17 22:50:10 -0500
Processing by TracksController#show as HTML
  Parameters: {"id"=>"2"}
  Track Load (0.7ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."id" = ? LIMIT 1  [["id", 2]]
  Rendered tracks/show.html.erb within layouts/application (2.0ms)
Completed 200 OK in 54ms (Views: 51.3ms | ActiveRecord: 0.7ms)


#Uso y configuracion de bases de datos en Rails
#vamos a config/database.yml


  #por defecto :)
  #Para usar sqlite3 podemos tipear en la terminal sqlite3
  #sqlite3 db/development.sqlite3 en este caso es la ruta que necesitamos
  #Eso nos abrirá una nueva consola de comandos similar por asi decirlo
  #a irb

  #podemos usar en esta consola:
    #.tables : para ver las tablas

    #Esto veremos en consola

jhon@jhon-Satellite-C645:/media/jhon/Disco local/Estudio/Ruby/musicapp$ sqlite3 db/development.sqlite3
SQLite version 3.8.11.1 2015-07-29 20:00:57
Enter ".help" for usage hints.
sqlite> .tables
schema_migrations  tracks           
sqlite> SELECT * FROM tracks;
1|Chan chan|Buena Vista Social Club|Buena Vista Social Club|2016-03-17 20:17:27.909494|2016-03-17 20:17:27.909494
2|Milonga del trovador|Andres-Obras Completas|Andres Calamaro|2016-03-17 21:01:50.708398|2016-03-18 03:50:10.013304
sqlite> 


#vemos que en nuestra tabla hay dos campos extra que no agregamos, es decir que 
#rails agrega por defecto uno es la fecha de ingreso y el otro es la fecha de edicion

#2016-03-17 21:01:50.708398|2016-03-18 03:50:10.013304

#.exit : para salir de la consola de sqlite3


#Esto sucede cuando decidimos elminar una cancion:

Started DELETE "/tracks/1" for 127.0.0.1 at 2016-03-18 23:33:50 -0500
Processing by TracksController#destroy as HTML
  Parameters: {"authenticity_token"=>"9PKc9rxgxIqvD2eiLi9+W03NlnAnB1N+X1+UtPGvx4rIplSF3XWY8lYl3e57mPsMPulrvaKzf1d/kJOrNaqtAg==", "id"=>"1"}
  Track Load (0.9ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."id" = ? LIMIT 1  [["id", 1]]
   (0.1ms)  begin transaction
  SQL (22.2ms)  DELETE FROM "tracks" WHERE "tracks"."id" = ?  [["id", 1]]
   (156.1ms)  commit transaction
Redirected to http://localhost:3000/tracks
Completed 302 Found in 266ms (ActiveRecord: 179.3ms)


#si revisas el archivo database.yml
#veras que cambié el motor de base de datos de sqlite3 por postgresql

#ahora debemos editar las dependencias del Gemfile
# agregamos la gema: gem 'pg'

#Para configurar nuestra base de datos podemos usar el comandos
#rake db:setup

$ rails console # o rails c : para abrir la consola de rails

irb(main):001:0> Track
=> Track (call 'Track.connection' to establish a connection)
irb(main):002:0> Track.connection
#El comando de arriba lo usamos para establecer una conexion
#con la base de datos
irb(main):003:0> Track
=> Track(id: integer, title: string, album: string, artist: string, created_at: datetime, updated_at: datetime)
#ahora podemos ver los atributos de Track
#Desde la consola podemos acceder a los modelos sin tener que usar
#la interfaz grafica de la aplicacion

irb(main):004:0> Track.count
#para saber cuantos registros tenemos
   (0.8ms)  SELECT COUNT(*) FROM "tracks"
=> 2


irb(main):008:0> Track.first
#para el primer dato
  Track Load (3.1ms)  SELECT  "tracks".* FROM "tracks"  ORDER BY "tracks"."id" ASC LIMIT 1
=> #<Track id: 1, title: "Chan chan", album: "Buena Vista Social Club", artist: "Buena Vista Social Club", created_at: "2016-03-19 05:11:10", updated_at: "2016-03-19 05:11:10">

#cuando agregamos un track desde la consola podemos ver

irb(main):009:0> Track.create title: 'a', artist: 'b', album: 'c'
   (0.3ms)  BEGIN
  SQL (0.4ms)  INSERT INTO "tracks" ("title", "artist", "album", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["title", "a"], ["artist", "b"], ["album", "c"], ["created_at", "2016-03-19 21:31:17.853940"], ["updated_at", "2016-03-19 21:31:17.853940"]]
   (12.5ms)  COMMIT
=> #<Track id: 3, title: "a", album: "c", artist: "b", created_at: "2016-03-19 21:31:17", updated_at: "2016-03-19 21:31:17">
irb(main):010:0> 


irb(main):011:0> cancion = Track.new
#creamos una nuevo objeto
=> #<Track id: nil, title: nil, album: nil, artist: nil, created_at: nil, updated_at: nil>

#podemos ingresar los datos de la siguiente manera
irb(main):012:0> cancion.title = '1'
=> "1"
irb(main):013:0> cancion.album = '2'
=> "2"
irb(main):014:0> cancion.artist = '3'
=> "3"

irb(main):015:0> cancion
=> #<Track id: nil, title: "1", album: "2", artist: "3", created_at: nil, updated_at: nil>
irb(main):016:0> cancion.save
#debemos guardar la cancion en la base de datos
   (0.4ms)  BEGIN
  SQL (0.4ms)  INSERT INTO "tracks" ("title", "album", "artist", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["title", "1"], ["album", "2"], ["artist", "3"], ["created_at", "2016-03-19 22:00:59.534893"], ["updated_at", "2016-03-19 22:00:59.534893"]]
   (12.6ms)  COMMIT
=> true



irb(main):018:0> Track.all
#para ver todas las canciones (en este caso)
  Track Load (0.6ms)  SELECT "tracks".* FROM "tracks"
=> #<ActiveRecord::Relation [#<Track id: 1, title: "Chan chan", album: "Buena Vista Social Club", artist: "Buena Vista Social Club", created_at: "2016-03-19 05:11:10", updated_at: "2016-03-19 05:11:10">, #<Track id: 2, title: "Creep", album: "Radiohead", artist: "Radiohead", created_at: "2016-03-19 21:20:30", updated_at: "2016-03-19 21:20:30">, #<Track id: 3, title: "a", album: "c", artist: "b", created_at: "2016-03-19 21:31:17", updated_at: "2016-03-19 21:31:17">, #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">]>
irb(main):019:0> canciones = Track.all
# (guardamos Track.all en un objeto)
  Track Load (0.7ms)  SELECT "tracks".* FROM "tracks"
=> #<ActiveRecord::Relation [#<Track id: 1, title: "Chan chan", album: "Buena Vista Social Club", artist: "Buena Vista Social Club", created_at: "2016-03-19 05:11:10", updated_at: "2016-03-19 05:11:10">, #<Track id: 2, title: "Creep", album: "Radiohead", artist: "Radiohead", created_at: "2016-03-19 21:20:30", updated_at: "2016-03-19 21:20:30">, #<Track id: 3, title: "a", album: "c", artist: "b", created_at: "2016-03-19 21:31:17", updated_at: "2016-03-19 21:31:17">, #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">]>

irb(main):020:0> canciones
=> #<ActiveRecord::Relation [#<Track id: 1, title: "Chan chan", album: "Buena Vista Social Club", artist: "Buena Vista Social Club", created_at: "2016-03-19 05:11:10", updated_at: "2016-03-19 05:11:10">, #<Track id: 2, title: "Creep", album: "Radiohead", artist: "Radiohead", created_at: "2016-03-19 21:20:30", updated_at: "2016-03-19 21:20:30">, #<Track id: 3, title: "a", album: "c", artist: "b", created_at: "2016-03-19 21:31:17", updated_at: "2016-03-19 21:31:17">, #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">]>
irb(main):021:0> canciones[0]
#podemos acceder mediante indices
=> #<Track id: 1, title: "Chan chan", album: "Buena Vista Social Club", artist: "Buena Vista Social Club", created_at: "2016-03-19 05:11:10", updated_at: "2016-03-19 05:11:10">
irb(main):022:0> canciones[1]
=> #<Track id: 2, title: "Creep", album: "Radiohead", artist: "Radiohead", created_at: "2016-03-19 21:20:30", updated_at: "2016-03-19 21:20:30">
irb(main):023:0> canciones[-1]
=> #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">

#podemos manipularlos como objetos

irb(main):025:0> canciones.first
=> #<Track id: 1, title: "Chan chan", album: "Buena Vista Social Club", artist: "Buena Vista Social Club", created_at: "2016-03-19 05:11:10", updated_at: "2016-03-19 05:11:10">
irb(main):026:0> canciones.last
=> #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">
irb(main):027:0> cancion = canciones.last
=> #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">
irb(main):028:0> cancion
=> #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">


#si editamos una cancion:

irb(main):028:0> cancion
=> #<Track id: 4, title: "1", album: "2", artist: "3", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">
irb(main):029:0> cancion.title
=> "1"
irb(main):030:0> cancion.artist
=> "3"
irb(main):031:0> cancion.album
=> "2"
irb(main):032:0> cancion.title = "Why you only call me when you're high"=> "Why you only call me when you're high"
irb(main):033:0> cancion.album = "AM"
=> "AM"
irb(main):034:0> cancion.artist = "Artic Monkeys"
=> "Artic Monkeys"
irb(main):035:0> cancion
=> #<Track id: 4, title: "Why you only call me when you're high", album: "AM", artist: "Artic Monkeys", created_at: "2016-03-19 22:00:59", updated_at: "2016-03-19 22:00:59">
irb(main):036:0> cancion.save
   (20.8ms)  BEGIN
  SQL (32.0ms)  UPDATE "tracks" SET "title" = $1, "album" = $2, "artist" = $3, "updated_at" = $4 WHERE "tracks"."id" = $5  [["title", "Why you only call me when you're high"], ["album", "AM"], ["artist", "Artic Monkeys"], ["updated_at", "2016-03-19 22:47:32.947154"], ["id", 4]]
   (8.4ms)  COMMIT
=> true

#para crear varias canciones al mismo tiempo

irb(main):037:0> 10.times do
#create guarda directamente en la base de datos
irb(main):038:1* Track.create title: 'cancion', album: 'album', artist: 'artista'
irb(main):039:1> end


#para encontrar elementos

irb(main):040:0> Track.last
#ultimo elemento
  Track Load (0.7ms)  SELECT  "tracks".* FROM "tracks"  ORDER BY "tracks"."id" DESC LIMIT 1
=> #<Track id: 14, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">
irb(main):041:0> Track.find 14
  #elemento por id
  Track Load (0.5ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."id" = $1 LIMIT 1  [["id", 14]]
=> #<Track id: 14, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">
irb(main):042:0> Track
=> Track(id: integer, title: string, album: string, artist: string, created_at: datetime, updated_at: datetime)

#otra forma es usando el where, recuerda que podemos poner mas de un atributo en la busqueda
#esto nos arroja un array
irb(main):043:0> canciones=Track.where title: 'cancion'
  Track Load (27.0ms)  SELECT "tracks".* FROM "tracks" WHERE "tracks"."title" = $1  [["title", "cancion"]]
=> #<ActiveRecord::Relation [#<Track id: 5, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 6, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 7, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 8, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 9, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 10, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 11, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 12, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 13, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 14, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">]>


#Al usar Track.find_by vamos a obtener el primer registro que coincida con la busqueda

irb(main):046:0> cancion = Track.find_by title: 'cancion'
  Track Load (0.5ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."title" = $1 LIMIT 1  [["title", "cancion"]]
=> #<Track id: 5, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">
irb(main):047:0> cancion = Track.find_by title: 'cancion'
  Track Load (0.6ms)  SELECT  "tracks".* FROM "tracks" WHERE "tracks"."title" = $1 LIMIT 1  [["title", "cancion"]]
=> #<Track id: 5, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">
irb(main):048:0> 

#para borrar podemos usar

irb(main):048:0> canciones=Track.where title: 'cancion'
#obtenemos un arreglo
  Track Load (0.7ms)  SELECT "tracks".* FROM "tracks" WHERE "tracks"."title" = $1  [["title", "cancion"]]
=> #<ActiveRecord::Relation [#<Track id: 5, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 6, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 7, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 8, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 9, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 10, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 11, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 12, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 13, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">, #<Track id: 14, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">]>
irb(main):049:0> cancion = canciones.last
#seleccionamos el ultimo elemento del arreglo
=> #<Track id: 14, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">
irb(main):050:0> cancion.destroy
   (0.2ms)  BEGIN
  SQL (0.5ms)  DELETE FROM "tracks" WHERE "tracks"."id" = $1  [["id", 14]]
   (11.1ms)  COMMIT
=> #<Track id: 14, title: "cancion", album: "album", artist: "artista", created_at: "2016-03-19 22:51:57", updated_at: "2016-03-19 22:51:57">
irb(main):051:0> 

irb(main):004:0> canciones=Track.where title: 'cancion'
#esto borra todas las canciones que coinciden con la busqueda


#RAILS SE BASA MUCHO EN CONVENCIONES SOBRE CONFIGURACIONES
#tiene en cuenta los singulares y los plurales, las mayusculas y las minusculas
#dependiendo el caso.
#REST <<< sigue cierto tipo de patrones indicado por rails

#Aparte de las vistas, podemos usar layauts para
#mostrar contenido que es comun para todas las vistas,
#asi evitamos escribir lineas repetidas app/views/layouts

#helpers ayudan a extraer cierta logica de las vistas
#para poder extraerla y usarla en cada una de las vistas
#nos ayudan a crear mas facil nuestras interfaces graficas

#creamos un modelo en app/models
#podemos ver el estado las migraciones con:

$ rake db:migrate:status

#generamos la migracion para poder generar una tabla

$ rails generate migration CreatePlayliists


#Revisamos el estado de las migraciones podemos ver que una esta down
rake db:migrate:status

database: musicapp_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20160317190533  Create tracks
  down    20160321022511  Create playliists


#para poder subirla usamos

$ rake db:migrate


#vmaos a db/migrate/nombre del migracion
#y agregamos datos a nuestra tabla

#desde la consola podemos:
irb(main):002:0> Playliist.connection
irb(main):002:0> Playliist
=> Playliist(id: integer, name: string, number_of_votes: integer)
irb(main):003:0> 
#ya podemos ver sus atributos :) 

#vamos al archivos routes.rb y creamos los recursos para playliist
resources :playliists
#para generar las rutas de playliist

#creamos un controlador 

$ rails generate controller playliists
#de esta manera
Warning: Running `gem pristine --all` to regenerate your installed gemspecs (and deleting then reinstalling your bundle if you use bundle --path) will improve the startup performance of Spring.
Running via Spring preloader in process 7495
      create  app/controllers/playliists_controller.rb
      invoke  erb
      create    app/views/playliists
      invoke  test_unit
      create    test/controllers/playliists_controller_test.rb
      invoke  helper
      create    app/helpers/playliists_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/playliists.coffee
      invoke    scss
      create      app/assets/stylesheets/playliists.scss

#necesitamos crear el metodo index en el controlador playlist controller

#ahora en las vistas debemos crear index.erb.rb para playlist

#nos dirijimos a app/views/index.hml.erb y vemos los cambios que hemos relaizado

#para poder editar y crear una nueva playlist creamos los metodos en 
#playlist controller y luego de ello creamos una vista para cada uno.
















































