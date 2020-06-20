class AddUserIdToPhrases < ActiveRecord::Migration[6.0]
  def change
  	add_column :phrases, :user_id, :integer
  end
end
