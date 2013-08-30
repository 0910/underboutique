class ProductController < ApplicationController
	def index
		@products = Product.all
	end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
  end

  def edit
  end

 
  def ropa
  	@products = Product.find(:all, :conditions => { :category => 'ropa'})
  	render :index
  end
  def zapatos
    @products = Product.find(:all, :conditions => {:category => 'zapatos'})
    render :index
  end
  def accesorios
    @products = Product.find(:all, :conditions => {:category => 'accesorios'})
    render :index
  end
end
