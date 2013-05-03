class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer "user_rating"
      t.string "comment_content"
      t.integer "user_id"
      t.integer "hotel_id"

      t.timestamps
    end
  end
end
