class CreateUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "display_name"
      t.string "profile_img_url"
      t.string "spotify_id"
      t.string "spotify_url"
      t.string "uri"
      t.string "access_token"
      t.string "refresh_token"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
