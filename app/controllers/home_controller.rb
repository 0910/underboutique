class HomeController < ApplicationController
	def index
		@products = Product.all
    @designers = Designer.all
    @collections = Collection.all
	end
end