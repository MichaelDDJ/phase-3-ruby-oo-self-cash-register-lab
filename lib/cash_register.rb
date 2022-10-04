require 'pry'
class CashRegister
    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    attr_accessor :cart
    attr_accessor :transactions

    def initialize (discount={})
        @total = 0.0
        @discount = discount
        @cart = []
        @transactions = []
    end

    def items
        @cart
    end

    def add_item (item, price, quantity = 1)
        @transactions << [item, price * quantity]
        self.cart = (@cart << ([item] * quantity)).flatten
        self.total += (price * quantity)
    end

    def apply_discount

        if (discount == {})
            "There is no discount to apply."
        elsif (discount > 0)
            self.total -= (self.total * (discount / 100.0))
            "After the discount, the total comes to $#{self.total.to_i}."
        end
        
    end

    def void_last_transaction
        self.cart.pop
        self.total -= @transactions[-1][-1]
        self.transactions.pop
    end

    
end

c1 = CashRegister.new
binding.pry