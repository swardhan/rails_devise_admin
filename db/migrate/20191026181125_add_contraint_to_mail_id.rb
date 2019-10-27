class AddContraintToMailId < ActiveRecord::Migration[5.2]
  def change
  	remove_column :queries, :mail_id
  	add_column :queries, :mail_id, :text, unique: true
  end
end
