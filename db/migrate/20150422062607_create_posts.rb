class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :village
      t.integer :unit_number
      t.integer :floor
      t.string :barangay
      t.integer :floor_area
      t.string :furnishing
      t.string :bedrooms
      t.string :bathrooms
      t.decimal :daily_rate
      t.decimal :weekly_rate
      t.decimal :monthly_rate

      t.timestamps null: false
    end
  end
end
