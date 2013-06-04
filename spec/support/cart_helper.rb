module CartHelper
  def new_empty_cart(session = {})
    Cart.new(session)
  end
  
  def new_cart_with_items(session = {})
    one = create(:product).id.to_s
    two = create(:product).id.to_s
    session[:shopping_cart] = {
      "#{one}_33"=> [one, 1, '33'],
      "#{two}_44" => [two, 10, '44'],
    }
    Cart.new(session)
  end
  
  def new_cart_with_various_designers(session = {})
    one = create(:product).id.to_s
    two = create(:product, designer: create(:designer, name: 'bulebucuye')).id.to_s
    session[:shopping_cart] = {
      "#{one}_33"=> [one, 1, '33'],
      "#{two}_44" => [two, 10, '44'],
    }
    Cart.new(session)
  end
end
