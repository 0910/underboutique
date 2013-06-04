class HomeController < ApplicationController
	def index
		@products = Product.all
    @designers = Designer.all
	end
end