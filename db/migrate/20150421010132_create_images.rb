class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.references :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
