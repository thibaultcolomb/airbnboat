class CreateBoats < ActiveRecord::Migration[7.1]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :port
      t.integer :capacity
      t.string :category
      t.integer :price_per_day
      t.string :license
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
