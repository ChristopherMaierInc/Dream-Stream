class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.integer :qty
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
