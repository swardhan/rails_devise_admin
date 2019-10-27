class AddSubjectAndFromToQuery < ActiveRecord::Migration[5.2]
  def change
  	add_column :queries, :mail_from, :text
  	add_column :queries, :subject, :text 
  end
end
