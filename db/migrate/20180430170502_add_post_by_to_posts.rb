class AddPostByToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_by, :string
  end
end
