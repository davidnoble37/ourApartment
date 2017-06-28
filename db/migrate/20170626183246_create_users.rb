class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :photo_url
      t.integer :apt_num
      t.text :roommates
      t.text :hobbies
      t.text :fav_local
      t.string :orig_home
      t.integer :move_yr

      t.timestamps
    end
  end
end
