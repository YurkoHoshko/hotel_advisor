class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string "name"
      t.integer  "star_rating"
      t.boolean  "breakfast_included"
      t.string "room_description"
      t.decimal "price", :precision => 10, :scale => 2
      t.string "country"
      t.string "state"
      t.string "city"
      t.string "street"



      t.timestamps
    end
  end
end
