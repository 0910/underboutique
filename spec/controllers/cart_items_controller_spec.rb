require 'spec_helper'

describe CartItemsController do
  render_views

  it 'uses the session in the cart' do
    expect do 
      post :create, product_id: create(:product).id, quantity: 5, size: '44'
      response.should be_redirect
    end.to change{ session[:shopping_cart] }
  end

  it 'shows cart items on the index' do
    cart = new_cart_with_items(request.session)
    controller.stub(shopping_cart: cart)
    get :index
    response.should be_ok
    assigns(:products).should == cart.items
  end

  it 'redirects to index after addition' do
    product = create(:product)
    post :create, product_id: product.id, quantity: 5, size: '33'
    response.should redirect_to(action: :index)
  end
  
  it 'still redirects, but flashes a message when adding fails' do
    post :create, product_id: '11111211', quantity: 10, size: '22'
    response.should redirect_to(action: :index)
    flash[:alert].should ==
      'No se pudo agregar el item al carrito porque ya no existe.'
  end

  it 'Alerts and redirects after deleting' do
    Cart.any_instance.should_receive(:delete).with('11_44')
    post :destroy, id: '11_44'
    response.should redirect_to(action: :index)
    flash[:alert].should == "Sacamos el item de tu carrito."
  end
 
  it 'does not add empty items' do
    post :create
    response.should redirect_to(action: :index)
    flash[:alert].should ==
      'No se pudo agregar el item al carrito porque ya no existe.'
  end

  it 'does not blow up on non-numeric quantities' do
    product = create(:product)
    post :create, product_id: product.id, quantity: 'twitter', size: '33'
    response.should redirect_to(action: :index)
    flash[:alert].should ==
      'No se pudo agregar el item al carrito porque ya no existe.'
  end
  
  it 'does not blow up if the item was not in the cart' do
    expect do
      post :destroy, id: '11_44'
    end.not_to raise_exception
  end
end
