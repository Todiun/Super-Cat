class AddPriceCentsToCats < ActiveRecord::Migration[8.0]
  def change
    add_column :cats, :price_cents, :integer
  end
end
