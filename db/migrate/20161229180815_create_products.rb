class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.string :seller
      t.decimal :price, precision: 8, scale: 2
      t.string :picture
      t.text :description

      t.timestamps
    end
  end
end
