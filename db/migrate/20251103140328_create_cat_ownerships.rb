class CreateCatOwnerships < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_ownerships do |t|
      t.belongs_to :cat, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
