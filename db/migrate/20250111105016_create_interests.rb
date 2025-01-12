class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.references :band_request, null: false, foreign_key: true
      t.references :participation_requsest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
