class CreateBandRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :band_requests do |t|
      t.string :name
      t.string :music_name
      t.integer :playing_time
      t.references :my_category, foreign_key: { to_table: 'categories' }, null: true
      t.references :recruting_category, foreign_key: { to_table: 'categories' }, null: true
      t.integer :count
      t.text :comment
      t.references :recruiting_user, foreign_key: { to_table: 'users' }, null: true
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
