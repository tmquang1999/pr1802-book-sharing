class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :share
      t.references :user, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
    add_index :books, [:user_id, :create_at]
  end
end
