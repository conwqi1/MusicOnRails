class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_name, null:false
      t.integer :album_id, null:false
      t.timestamps
    end
    add_index :tracks, [:track_name, :album_id], :unique => true
  end
end
