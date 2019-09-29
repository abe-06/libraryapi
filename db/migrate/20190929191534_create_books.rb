class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :isbn
      t.string :collection
      t.decimal :price, precision: 5, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
