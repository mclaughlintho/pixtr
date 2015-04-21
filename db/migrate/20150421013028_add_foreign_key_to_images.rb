class AddForeignKeyToImages < ActiveRecord::Migration
  def change
    add_foreign_key :images, :galleries
  end
end
