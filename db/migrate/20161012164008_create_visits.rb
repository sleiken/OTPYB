class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id, :place_id, null: false
      t.timestamps null: false
    end
  end
end
