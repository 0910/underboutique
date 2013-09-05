class DesignersController < ApplicationController
  def index
    @designers = Designer.all
  end

  def show
    @designer = Designer.find(params[:id]) 
    @collections = Collection.find(:all, :conditions => {:designer_id => params[:id]})
  end
end