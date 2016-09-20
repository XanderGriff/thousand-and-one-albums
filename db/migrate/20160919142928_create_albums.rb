class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      
      t.string  :name
      t.string  :artist
      t.string  :album_art_url
      t.integer :track_no
      t.integer :runtime
      t.text    :summary

      t.timestamps
    end
  end
end