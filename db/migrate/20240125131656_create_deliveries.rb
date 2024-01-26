class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :surname
      t.string :lastname
      t.string :phone
      t.string :email
      t.integer :weight
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :price
      t.integer :distance
      t.string :departure_point
      t.string :destination

      t.timestamps
    end
  end
end