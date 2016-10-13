class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city, :country, limit: 64, null: false
      t.string :state, limit: 64
      t.decimal :lat, :lng, null: false
      t.timestamps
    end
  end
end
