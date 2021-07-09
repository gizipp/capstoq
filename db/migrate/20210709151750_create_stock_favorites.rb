class CreateStockFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_favorites do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :stock_favorites, [:stock_id, :user_id]
  end
end
