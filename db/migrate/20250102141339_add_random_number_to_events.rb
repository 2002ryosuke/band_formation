class AddRandomNumberToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :random_number, :string
    add_index :events, :random_number, unique: true
  end
end
