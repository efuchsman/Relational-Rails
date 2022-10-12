class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :dealer_id
      t.string :make
      t.string :model
      t.integer :year
      t.integer :miles
      t.boolean :available_for_lease
      t.integer :price
      t.timestamps
    end
  end
end
