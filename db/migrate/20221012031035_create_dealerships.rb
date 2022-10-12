class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :city
      t.string :dealername
      t.integer :number_of_stars_rating
      t.boolean :lease_program
      t.timestamps
    end
  end
end
