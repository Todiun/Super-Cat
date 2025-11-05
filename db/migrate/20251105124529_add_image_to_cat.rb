class AddImageToCat < ActiveRecord::Migration[8.0]
  def change
    add_column :cats, :cat_image, :string
  end
end
