class Track < ActiveRecord::Base
	#has_and_belongs_to_many :playlists
	#acá tenems nuestra clase Track
	#los modelos tienen los componentes que forman nuestro sistema
	#esta clase hereda de ActiveRecord::Base
	#ActiveRecord es: una capa que se encarga de que nosotros podamos conectar
	#nuestra app directamente con la base de datos.
	#en vez de trabajar directamente con el codigo de sql para hacer consultas y extraer la informacion
	#nos ofrece que lo hagamos mediante objetos y metodos de esos objetos
	validates_presence_of :title, :album, :artist
	#lo usamos para evitar que los campos queden vacios
end

