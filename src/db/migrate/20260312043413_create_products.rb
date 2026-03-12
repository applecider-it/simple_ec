class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :products, :discarded_at
  end
end
