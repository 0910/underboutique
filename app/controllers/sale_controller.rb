class SaleController < ApplicationController
  def index
    @products = Product.find(:all, :conditions => {:sale => true}, :order => 'id DESC')
  end
end
