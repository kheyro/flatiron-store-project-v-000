class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :cart, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :status
      t.timestamps null: false
    end
  end
end
