class RemoveFileuploadToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :filename, :string
    remove_column :posts, :file, :binary
  end
end
