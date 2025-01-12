class CreateParticipationRequsests < ActiveRecord::Migration[7.0]
  def change
    create_table :participation_requsests do |t|
      t.references :category, null: false, foreign_key: true
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :band_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
