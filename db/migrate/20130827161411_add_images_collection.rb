class AddImagesCollection < ActiveRecord::Migration
  def change
  	change_table :images do |t|
  		t.references :collections
  	end
  end

end
