class AddFileuploadToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :filename, :string
    add_column :posts, :file, :binary
  end
end
