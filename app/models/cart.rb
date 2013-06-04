# A cart is a tableless model dealing with the serialization and de-serialization of
# items in the shopping cart.
class Cart
  attr_accessor :session

  def initialize(session)
    self.session = session
    self.session[:shopping_cart] ||= {}
    @raw_items = self.session[:shopping_cart]
  end
    
  def empty?
    @raw_items.size == 0
  end
  
  # The pairs of {Product} and their quantities.
  def items
    @raw_items.values.collect do |product_id, quantity, size|
      [Product.find_by_id(product_id), quantity.to_i, size]
    end.compact
  end
  
  def items_for_designer(designer)
    items.select{|i| i.first.designer == designer }
  end
  
  def items_by_designer
    items.group_by{|i| i.first.designer }
  end
  
  def amount_for_designer(designer)
    items_for_designer(designer).collect{|item, quantity, size| item.price * quantity }.sum
  end
  
  # Puts an item on the cart. Must be an existing active product.
  def add(product_id, quantity_string, size)
    key = "#{ product_id.to_s }_#{size}"
    product = Product.find_by_id(product_id.to_s)
    quantity = quantity_string.to_i

    return false if quantity < 1
    return false if product.nil? || !product.available?
    
    if @raw_items[key].nil?
      @raw_items[key] = [product_id, quantity, size]
    else
      @raw_items[key][1] = @raw_items[key][1].to_i + quantity.to_i
    end

    return true
  end
  
  # Removes an item from the cart, it does not fail if the given id was not in the cart.
  def delete(product_id)
    @raw_items.delete(product_id.to_s)
  end
  
  # The total amount for this cart, for all the items and their quantities.
  def amount
    items.collect{|item, quantity, size| item.price * quantity }.sum
  end
  
  def clear
    @raw_items.clear
  end
end
