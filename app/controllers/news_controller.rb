class NewsController < ApplicationController
  def index
    @products = Product.all
  end
  def designer
    @products = Product.all
    render :index
  end
end
