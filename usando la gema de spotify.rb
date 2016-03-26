irb(main):001:0> RSpotify
=> RSpotify
#modulo principal de la gema
#lo usa a modo de name espace
irb(main):002:0> RSpotify::Track
#Este Track corresponde a la gema
}=> RSpotify::Track
irb(main):003:0> Track.connection
irb(main):004:0> canciones = RSpotify::Track.search("Do I wanna know")
#la gema tiene metodos que usan los endpoints de spotify
irb(main):006:0> canciones.count
=> 20
irb(main):008:0> cancion=canciones.first
irb(main):009:0> cancion.class
=> RSpotify::Track
irb(main):010:0> cancion.methods
#cancion con todos sus metodos (hasta los heredados)
irb(main):011:0> cancion.methods.sort - Object.methods
#metodos propios de cancion
=> [:complete!, :hash_for, :method_missing]
irb(main):012:0> cancion.artists.count
=> 1
irb(main):015:0> cancion.artists.first
=> #<RSpotify::Artist:0x0000000579b170 @followers=nil, @genres=nil, @images=nil, @name="Arctic Monkeys", @popularity=nil, @top_tracks={}, @external_urls={"spotify"=>"https://open.spotify.com/artist/7Ln80lUS6He07XvHI8qqHH"}, @href="https://api.spotify.com/v1/artists/7Ln80lUS6He07XvHI8qqHH", @id="7Ln80lUS6He07XvHI8qqHH", @type="artist", @uri="spotify:artist:7Ln80lUS6He07XvHI8qqHH">
irb(main):016:0> cancion.artists.first.name
=> "Arctic Monkeys"
irb(main):017:0> 
irb(main):018:0> cancion.album
=> #<RSpotify::Album:0x0000000579b5a8 @album_type="album", @available_markets=["AD", "AT", "BE", "BG", "CA", "CH", "CY", "CZ", "DE", "DK", "EE", "ES", "FI", "FR", "GB", "GR", "HK", "HU", "IE", "IS", "IT", "LI", "LT", "LU", "LV", "MC", "MT", "MY", "NL", "NO", "PH", "PL", "PT", "RO", "SE", "SG", "SI", "SK", "SV", "TR", "TW", "US"], @copyrights=nil, @external_ids=nil, @genres=nil, @images=[{"height"=>640, "url"=>"https://i.scdn.co/image/4d9ec146e3a257b10634d9a413ef6cc3de325008", "width"=>640}, {"height"=>300, "url"=>"https://i.scdn.co/image/956296446175bba4ccdfd6edce8c78e31d8a9add", "width"=>300}, {"height"=>64, "url"=>"https://i.scdn.co/image/6d8f0b88783515c116fdbbe92c6d54e7f15c37c2", "width"=>64}], @name="AM", @popularity=nil, @release_date=nil, @release_date_precision=nil, @artists=nil, @tracks_cache=nil, @external_urls={"spotify"=>"https://open.spotify.com/album/5bU1XKYxHhEwukllT20xtk"}, @href="https://api.spotify.com/v1/albums/5bU1XKYxHhEwukllT20xtk", @id="5bU1XKYxHhEwukllT20xtk", @type="album", @uri="spotify:album:5bU1XKYxHhEwukllT20xtk">
irb(main):019:0> cancion.album.name
=> "AM"
irb(main):020:0> cancion.name
=> "Do I Wanna Know?"
###############################Artista#############################
irb(main):021:0> RSpotify::Artist
=> RSpotify::Artist
irb(main):022:0> RSpotify::Artist.search("Kings of Leon")
=> [#<RSpotify::Artist:0x0000000569f848 @followers={"href"=>nil, "total"=>1333531}, @genres=[], @images=[{"height"=>807, "url"=>"https://i.scdn.co/image/433b7abc8aa0bae2e009756a81559550ae2ddd71", "width"=>1000}, {"height"=>516, "url"=>"https://i.scdn.co/image/89163bd1bfb178cffefda1a9edc16b40ef5b014a", "width"=>640}, {"height"=>161, "url"=>"https://i.scdn.co/image/bd0a8c20343ff2bb9adb62d0c8e407bfd294a2bb", "width"=>200}, {"height"=>52, "url"=>"https://i.scdn.co/image/8175236089cb4a5ea2df32a03c006fd83f626a74", "width"=>64}], @name="Kings of Leon", @popularity=79, @top_tracks={}, @external_urls={"spotify"=>"https://open.spotify.com/artist/2qk9voo8llSGYcZ6xrBzKx"}, @href="https://api.spotify.com/v1/artists/2qk9voo8llSGYcZ6xrBzKx", @id="2qk9voo8llSGYcZ6xrBzKx", @type="artist", @uri="spotify:artist:2qk9voo8llSGYcZ6xrBzKx">]
irb(main):023:0> artist = _
#cuando usamos el _ significa que usamos la ultima consulta hecha en la consola
=> [#<RSpotify::Artist:0x0000000569f848 @followers={"href"=>nil, "total"=>1333531}, @genres=[], @images=[{"height"=>807, "url"=>"https://i.scdn.co/image/433b7abc8aa0bae2e009756a81559550ae2ddd71", "width"=>1000}, {"height"=>516, "url"=>"https://i.scdn.co/image/89163bd1bfb178cffefda1a9edc16b40ef5b014a", "width"=>640}, {"height"=>161, "url"=>"https://i.scdn.co/image/bd0a8c20343ff2bb9adb62d0c8e407bfd294a2bb", "width"=>200}, {"height"=>52, "url"=>"https://i.scdn.co/image/8175236089cb4a5ea2df32a03c006fd83f626a74", "width"=>64}], @name="Kings of Leon", @popularity=79, @top_tracks={}, @external_urls={"spotify"=>"https://open.spotify.com/artist/2qk9voo8llSGYcZ6xrBzKx"}, @href="https://api.spotify.com/v1/artists/2qk9voo8llSGYcZ6xrBzKx", @id="2qk9voo8llSGYcZ6xrBzKx", @type="artist", @uri="spotify:artist:2qk9voo8llSGYcZ6xrBzKx">]
irb(main):024:0> artist.count
=> 1
irb(main):025:0> artist=artist.first
=> #<RSpotify::Artist:0x0000000569f848 @followers={"href"=>nil, "total"=>1333531}, @genres=[], @images=[{"height"=>807, "url"=>"https://i.scdn.co/image/433b7abc8aa0bae2e009756a81559550ae2ddd71", "width"=>1000}, {"height"=>516, "url"=>"https://i.scdn.co/image/89163bd1bfb178cffefda1a9edc16b40ef5b014a", "width"=>640}, {"height"=>161, "url"=>"https://i.scdn.co/image/bd0a8c20343ff2bb9adb62d0c8e407bfd294a2bb", "width"=>200}, {"height"=>52, "url"=>"https://i.scdn.co/image/8175236089cb4a5ea2df32a03c006fd83f626a74", "width"=>64}], @name="Kings of Leon", @popularity=79, @top_tracks={}, @external_urls={"spotify"=>"https://open.spotify.com/artist/2qk9voo8llSGYcZ6xrBzKx"}, @href="https://api.spotify.com/v1/artists/2qk9voo8llSGYcZ6xrBzKx", @id="2qk9voo8llSGYcZ6xrBzKx", @type="artist", @uri="spotify:artist:2qk9voo8llSGYcZ6xrBzKx">
irb(main):026:0> artist.name
=> "Kings of Leon"
irb(main):030:0> artist.albums.count
=> 20
irb(main):031:0> artist.albums.first
=> #<RSpotify::Album:0x00000005524720 @album_type="album", @available_markets=["AD", "AR", "AT", "AU", "BE", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GR", "GT", "HK", "HN", "HU", "IE", "IS", "IT", "LI", "LT", "LU", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "NZ", "PA", "PE", "PH", "PL", "PT", "PY", "RO", "SE", "SG", "SI", "SK", "SV", "TR", "TW", "US", "UY"], @copyrights=nil, @external_ids=nil, @genres=nil, @images=[{"height"=>640, "url"=>"https://i.scdn.co/image/553913c2ddae8bcfd905bcdec0b45ec9c66a5786", "width"=>640}, {"height"=>300, "url"=>"https://i.scdn.co/image/f271a33e51f7a53d3eb94e870fa802d3fffe9cbc", "width"=>300}, {"height"=>64, "url"=>"https://i.scdn.co/image/49541eb2a0c0d7475655cacd0d8148a5155c731d", "width"=>64}], @name="Mechanical Bull (Deluxe Version)", @popularity=nil, @release_date=nil, @release_date_precision=nil, @artists=nil, @tracks_cache=nil, @external_urls={"spotify"=>"https://open.spotify.com/album/0cRJKK0y1sfZEqWub4dK9v"}, @href="https://api.spotify.com/v1/albums/0cRJKK0y1sfZEqWub4dK9v", @id="0cRJKK0y1sfZEqWub4dK9v", @type="album", @uri="spotify:album:0cRJKK0y1sfZEqWub4dK9v">
irb(main):032:0> artist.albums.first.name
=> "Mechanical Bull (Deluxe Version)"
irb(main):033:0> artist.albums.map {|a| a.name}
#podemos mapear para ver mejor nuestra informacion
=> ["Mechanical Bull (Deluxe Version)", "Come Around Sundown", "Come Around Sundown", "Come Around Sundown (Deluxe Version)", "Come Around Sundown (Deluxe Edition)", "Only By The Night", "Only By the Night", "Only By The Night", "Only By The Night", "Only By The Night", "Live From SoHo", "Because Of The Times", "Because Of The Times", "Because Of The Times", "Because Of The Times", "Day Old Belgian Blues", "Day Old Belgian Blues", "Aha Shake Heartbreak", "Aha Shake Heartbreak", "Aha Shake Heartbreak"]
irb(main):034:0> artist.albums.map {|a| a.name}.sort
=> ["Aha Shake Heartbreak", "Aha Shake Heartbreak", "Aha Shake Heartbreak", "Because Of The Times", "Because Of The Times", "Because Of The Times", "Because Of The Times", "Come Around Sundown", "Come Around Sundown", "Come Around Sundown (Deluxe Edition)", "Come Around Sundown (Deluxe Version)", "Day Old Belgian Blues", "Day Old Belgian Blues", "Live From SoHo", "Mechanical Bull (Deluxe Version)", "Only By The Night", "Only By The Night", "Only By The Night", "Only By The Night", "Only By the Night"]

##################################################
####Ahora vamos a crear un nuevo controlador######
##################################################
$ rails g controller spotify search
Warning: Running `gem pristine --all` to regenerate your installed gemspecs (and deleting then reinstalling your bundle if you use bundle --path) will improve the startup performance of Spring.
Running via Spring preloader in process 11479
      create  app/controllers/spotify_controller.rb
       route  get 'spotify/search'
      invoke  erb
      create    app/views/spotify
      create    app/views/spotify/search.html.erb
      invoke  test_unit
      create    test/controllers/spotify_controller_test.rb
      invoke  helper
      create    app/helpers/spotify_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/spotify.coffee
      invoke    scss
      create      app/assets/stylesheets/spotify.scss

$ rake routes

        Prefix Verb   URI Pattern                   Controller#Action
spotify_search GET    /spotify/search(.:format)     spotify#search
        tracks GET    /tracks(.:format)             tracks#index
               POST   /tracks(.:format)             tracks#create
     new_track GET    /tracks/new(.:format)         tracks#new
    edit_track GET    /tracks/:id/edit(.:format)    tracks#edit
         track GET    /tracks/:id(.:format)         tracks#show
               PATCH  /tracks/:id(.:format)         tracks#update
               PUT    /tracks/:id(.:format)         tracks#update
               DELETE /tracks/:id(.:format)         tracks#destroy
     playlists GET    /playlists(.:format)          playlists#index
               POST   /playlists(.:format)          playlists#create
  new_playlist GET    /playlists/new(.:format)      playlists#new
 edit_playlist GET    /playlists/:id/edit(.:format) playlists#edit
      playlist GET    /playlists/:id(.:format)      playlists#show
               PATCH  /playlists/:id(.:format)      playlists#update
               PUT    /playlists/:id(.:format)      playlists#update
               DELETE /playlists/:id(.:format)      playlists#destroy
jhon@jhon-Satellite-C645:/media/jhon/Disco local/Estudio/Ruby/musiconrails$ 

ahora vamos a estar editando el archivo index de la vista de tracks, el index de searchs y el spotify controller


