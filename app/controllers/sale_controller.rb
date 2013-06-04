class SaleController < ApplicationController
  def index
    @designers = Designer.all
    @products = Product.all
  end
end
