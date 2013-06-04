#encoding: utf-8
require 'spec_helper'

describe OrdersController do
  render_views
  
  it 'shows the form for creating a new order' do
    new_cart_with_items(request.session)
    get :new
    response.should be_ok
    assigns(:order).should_not be_nil
  end
  
  it 'should not show checkout form when cart is empty' do
    get :new
    response.should redirect_to(cart_items_path)
    flash[:alert].should == 'Tu carrito está vacio, deberías agregar items a tu carrito antes.'
  end
  
  it 'creates a new order from the current cart' do
    new_cart_with_items(request.session)
    expect do
      post :create, order: attributes_for(:order)
    end.to change{ Order.count }.by(1)

    response.should redirect_to(cart_items_path)
    order = assigns(:order)
    flash[:notice].should =~ /Tu orden fue enviada. El número de tu orden es #{order.code}/
    controller.shopping_cart.should be_empty
  end

  it 'does not create an order if cart is empty, redirects instead' do
    expect do
      post :create, order: attributes_for(:order)
    end.not_to change{ Order.count }

    response.should redirect_to(cart_items_path)
    flash[:alert].should == 'Tu carrito está vacio, deberías agregar items a tu carrito antes.'
  end
  
  it 'reshows the form if any field is invalid' do
    new_cart_with_items(request.session)
    expect do
      post :create, order: {}
    end.not_to change{ Order.count }

    response.should be_ok
    assigns(:order).should_not be_valid
    controller.shopping_cart.should_not be_empty
  end
end
