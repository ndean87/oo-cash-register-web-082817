require 'pry'
class CashRegister

  attr_accessor :total
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item = []
    @prices = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity

    @prices << price

    num_of_item = 0
    while num_of_item < quantity
      num_of_item += 1
      @item << title
    end

  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      dis = @total * (discount.to_f / 100)
      @total -= dis
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @item
  end

  def void_last_transaction
    @total = @total - @prices[-1]
  end
end
