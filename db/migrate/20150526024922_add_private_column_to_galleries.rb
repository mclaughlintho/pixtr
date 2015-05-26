class AddPrivateColumnToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :private, :boolean
  end
end
