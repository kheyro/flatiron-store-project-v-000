class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :cart, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.integer :quantity
    end
  end
end
