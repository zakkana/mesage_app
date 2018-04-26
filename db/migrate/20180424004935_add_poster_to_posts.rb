class AddPosterToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :poster, :string
    add_reference :posts, :users, foreign_key: true
  end
end
