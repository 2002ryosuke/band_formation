class MakeEventsNameNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :events, :name, false
  end
end
