class AddApproveToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :approve, :boolean
  end
end
