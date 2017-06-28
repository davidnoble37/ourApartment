class AddColumnToReply < ActiveRecord::Migration[5.1]
  def change
    add_reference :replies, :topic, foreign_key: true
  end
end
