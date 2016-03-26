#creamos nuestro modelo
class Playlist < ActiveRecord::Base
	#has_and_belongs_to_many :tracks

	
	
	validates_presence_of :name, :number_of_votes
	#lo usamos para evitar que los campos queden vacios
end