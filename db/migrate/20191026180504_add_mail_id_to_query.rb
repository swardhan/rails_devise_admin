class AddMailIdToQuery < ActiveRecord::Migration[5.2]
  def change
  	add_column :queries, :mail_id, :text
  end
end
