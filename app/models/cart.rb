class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :orders
  has_many :items, through: :line_items
  belongs_to :user

  def total
    self.line_items.map{ |i| i.quantity * i.item.price }.inject(0, &:+)
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item: item_id)
    if line_item
      line_item.update(quantity: line_item.quantity + 1)
      self
    else
      self.line_items.build(item_id: item_id, quantity: 1)
    end
  end

  def checkout
    self.line_items.each do |line|
      line.item.inventory -= line.quantity
      line.item.save
    end

    self.update(status: "submitted")
  end
end
