class CartItemsController < ApplicationController
  def index
    @products = shopping_cart.items
    @designers = shopping_cart.items_by_designer
  end

  def create
    unless shopping_cart.add(params[:product_id], params[:quantity], params[:size])
      redirect_to({action: :index}, alert: 'No se pudo agregar el item al carrito porque ya no existe.')
      return
    end
    redirect_to action: :index
  end
  
  def destroy
    shopping_cart.delete(params[:id])
    redirect_to({action: :index}, alert: 'Sacamos el item de tu carrito.')
  end
end
