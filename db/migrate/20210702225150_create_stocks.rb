class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
