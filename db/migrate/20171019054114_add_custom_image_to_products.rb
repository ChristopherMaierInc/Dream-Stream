class AddCustomImageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :custom_image, :string
  end
end
