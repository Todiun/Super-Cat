class CreateCats < ActiveRecord::Migration[8.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :race
      t.text :description
      t.timestamps
      t.integer :price_cents
    end
  end
end
