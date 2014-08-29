class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name, null:false
      t.integer :band_id, null:false
      t.timestamps
    end
    add_index :albums, [:album_name, :band_id], :unique => true
  end
end
