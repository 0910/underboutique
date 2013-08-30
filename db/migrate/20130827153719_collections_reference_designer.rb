class CollectionsReferenceDesigner < ActiveRecord::Migration
  def change
  	change_table :collections do |t|
  		t.references :designer
  	end
  end

end
