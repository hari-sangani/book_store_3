class CreateAuthorsBooksJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :authors, :books do |t|
      t.references :author, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
    end
  end
end
