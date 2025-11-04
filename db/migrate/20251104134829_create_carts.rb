class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.references :interested_user, foreign_key: {to_table: :users}, index: true
      t.references :carted_cat, foreign_key: {to_table: :cats}, index: true
      t.timestamps 
    end
  end
end
