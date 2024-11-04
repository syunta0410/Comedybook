class CreatePostingbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :postingbooks do |t|
      t.string :title
      t.string :author
      t.string :account
      t.string :image
      t.integer :released_year

      t.timestamps
    end
  end
end
