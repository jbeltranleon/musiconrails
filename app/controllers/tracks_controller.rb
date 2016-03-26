class TracksController < ApplicationController

  
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  #before_action es un filtro
  #se llama cuando consultamos los metofos, edit, update o destroy
  #vamos a set_track
  before_action :authenticate_user!
  

  # GET /tracks
  # GET /tracks.json
  def index
    #acá esta el metodo index
    @tracks = Track.all
    #de nuestro modelo track va a traer todos los modelos del sistema
    #y lo guarda en una variable llamada @tracks 
    #despues esa variable se envia a una de las vistas app/views
    #en donde tendremos una carpeta por cada uno de nuestros controladores
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created//Le quedó una chimba parce.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  #acá estan las rutas
  def update
    respond_to do |format|
      if @track.update(track_params)
        #si podemos editar
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        #muestra el formulario
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_track
    #busca por el id, la cancion en especifico
    #y lo guarda en la variable track
    #ahora vamos a app/views/show.html.erb
      @track = Track.find(params[:id])
      #Track es una clase podemos encontrarla en app/models/track.rb
      #llama una funcion llamada find, lo cual hace que podamos 
      #editar la cancion que queremos editar o borrar segun el id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :album, :artist)
    end
end