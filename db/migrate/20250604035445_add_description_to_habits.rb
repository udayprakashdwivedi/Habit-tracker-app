class AddDescriptionToHabits < ActiveRecord::Migration[8.0]
  def change
    add_column :habits, :description, :text
  end
end
