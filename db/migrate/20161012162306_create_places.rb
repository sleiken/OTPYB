class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :placeId, null: false
      # t.string :city, :country, limit: 64, null: false
      # t.string :state, limit: 64
      # t.decimal :lat, :lng, null: false
      t.timestamps null: false
    end
  end
end
