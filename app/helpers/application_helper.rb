module ApplicationHelper
  def display_price(price)
    number_to_currency(price/100)
  end
end
