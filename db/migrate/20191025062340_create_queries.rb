class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.text :body
      t.text :reply
      t.boolean :replied
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
