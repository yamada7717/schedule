class ChangeDatatypeForPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :start_date, :datetime
    change_column :posts, :end_date, :datetime
  end
end
