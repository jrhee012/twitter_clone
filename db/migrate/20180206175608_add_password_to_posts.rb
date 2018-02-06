class AddPasswordToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :password, :string
  end
end
