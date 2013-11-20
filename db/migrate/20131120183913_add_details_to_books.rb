class AddDetailsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :price, :string
    add_column :books, :shipping_weight, :string
    add_column :books, :isbn10, :string
  end
end
