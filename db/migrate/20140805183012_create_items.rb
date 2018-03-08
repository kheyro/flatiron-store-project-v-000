class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.belongs_to :category, index: true, foreign_key: true
      t.integer :inventory
      t.decimal :price
    end
  end
end
