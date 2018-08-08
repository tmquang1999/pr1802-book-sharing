class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :link
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
