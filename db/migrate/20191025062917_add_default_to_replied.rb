class AddDefaultToReplied < ActiveRecord::Migration[5.2]
  def change
  	change_column :queries, :replied, :boolean, default: false
  end
end
