class AddUniqueToMailId < ActiveRecord::Migration[5.2]
  def change
  	add_index_options :queries, :mail_id, unique: true
  end
end
