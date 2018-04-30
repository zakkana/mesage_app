class RemoveAddPosterToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :poster, :string
  end
end
