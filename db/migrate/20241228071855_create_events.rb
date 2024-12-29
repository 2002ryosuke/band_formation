class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :day
      t.string :place
      t.integer :min_bans
      t.integer :max_bans
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
