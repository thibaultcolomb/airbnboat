class RemoveImageFromBoats < ActiveRecord::Migration[7.1]
  def change
    remove_column :boats, :image, :string
  end
end
