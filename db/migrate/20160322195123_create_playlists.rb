class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
    	#de esta manera agregamos datos a nuestra tabla
    	t.string :name
    	t.integer :number_of_votes
    end
  end
end
