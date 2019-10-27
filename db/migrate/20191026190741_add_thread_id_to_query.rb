class AddThreadIdToQuery < ActiveRecord::Migration[5.2]
  def change
  	add_column :queries, :thread_id, :text
  end
end
