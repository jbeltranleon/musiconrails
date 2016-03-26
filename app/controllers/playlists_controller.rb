class PlaylistsController < ApplicationController

	before_action :authenticate_user!


	def index#primera parte vamos app/views y creamos index.html.rb
		@playlists  = Playlist.all
		#el Playlist.all viene del modelo Playlist
		#el @simboliza variables que corresponden a la instancia
		#con esto nos traemos todas las listas de reproduccion disponibles
	end

	def show
		@playlist = Playlist.find(params[:id])
	end

	def new
		@playlist = Playlist.new
	end

	def create
		#strong params
		@playlist = Playlist.new(playlist_params)
		if @playlist.save
			redirect_to @playlist
			#podemos usar redirect_to en vez de usar el 
			#redireccionamiento con http para ahorrar tiempo
		else
			render :new
		end
	end

	private

	def playlist_params
		params.require(:playlist).permit(:name, :number_of_votes)
		
	end
end
