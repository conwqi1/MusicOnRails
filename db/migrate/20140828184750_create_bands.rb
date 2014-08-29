class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :band_name, null:false
      t.integer :owner_id, null:false
      t.timestamps
    end
    add_index :bands, [:band_name, :owner_id], :unique => true
  end
end
