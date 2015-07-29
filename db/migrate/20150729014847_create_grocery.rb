class CreateGrocery < ActiveRecord::Migration
  def change
    create_table :groceries do |t|
      t.integer :user_id
      t.integer :count
      t.string :unit
      t.date :exp_date
      t.string :name

      t.timestamps
    end
  end
end
