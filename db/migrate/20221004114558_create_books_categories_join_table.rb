class CreateBooksCategoriesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :categories do |t|
      t.references :book, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
