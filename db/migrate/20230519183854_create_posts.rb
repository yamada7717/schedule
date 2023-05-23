class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :start_date
      t.integer :end_date
      t.string :introduction

      t.timestamps
    end
  end
end
