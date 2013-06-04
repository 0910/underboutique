#encoding: utf-8
class OrdersController < ApplicationController
  before_filter :require_cart_to_have_items

  def new
    @order = Order.new
  end
  
  def create
    orders = Order.from_cart(shopping_cart, params[:order])
    if orders
      notice = if orders.size == 1
        "Tu orden fue enviada. El número de tu orden es #{orders.first.code}. Deberías recibir un email con los datos de tu orden en breve. Guarda tu número de orden y contáctanos si tienes alguna consulta adicional."
      else 
        "Tus ordenes fueron enviadas a cada diseñador. Los números de las mismas son: #{orders.collect(&:code).join(', ')}. Deberías recibir un email con los datos de cada orden en breve. Guarda tus números de orden y contáctanos si tienes alguna consulta adicional."
      end
      redirect_to cart_items_path, notice: notice
      shopping_cart.clear
    else
      @order = Order.new(params[:order])
      render :new
    end
  end
  
  # All actions in this controller need to have a non-empty shopping cart.
  def require_cart_to_have_items
    if shopping_cart.empty?
      redirect_to(cart_items_path, alert: 'Tu carrito está vacio, deberías agregar items a tu carrito antes.')
    end
  end
end

