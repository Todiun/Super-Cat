class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.belongs_to :cat, index: true
      t.belongs_to :user, index: true
      t.text :content
      t.timestamps
    end
  end
end
