class AddColumnToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :topic, :string
  end
end
