class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :status
    end
  end
end
