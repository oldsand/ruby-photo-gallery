class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.boolean :is_public, default: true
      t.integer :coner_photo_id

      t.timestamps null: false
    end
  end
end
