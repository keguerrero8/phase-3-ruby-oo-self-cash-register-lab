class CashRegister
    attr_accessor :total, :discount, :items, :items_price
    def initialize discount=0
        @total = 0
        @discount = discount
        @items = []
        @items_price = []
    end

    def add_item title, price, quantity=1
        items_price_arr = [price]*quantity
        self.items_price.concat(items_price_arr)
        items_arr = [title]*quantity
        self.items.concat(items_arr)
        self.total += price*quantity
    end

    def apply_discount
        if self.discount != 0
            self.total -= self.discount.to_f/100*self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        rm_count = self.items.count(self.items[-1])
        self.total -= self.items_price.pop*rm_count
    end

end
