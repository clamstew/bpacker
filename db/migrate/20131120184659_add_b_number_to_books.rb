class AddBNumberToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_number, :string
  end
end
