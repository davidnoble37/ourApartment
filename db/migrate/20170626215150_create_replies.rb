class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.text :body
      t.belongs_to :message, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
