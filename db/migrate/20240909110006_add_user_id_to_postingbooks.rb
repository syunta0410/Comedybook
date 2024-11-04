class AddUserIdToPostingbooks < ActiveRecord::Migration[6.1]
  def change
    add_column :postingbooks, :user_id, :integer
  end
end
