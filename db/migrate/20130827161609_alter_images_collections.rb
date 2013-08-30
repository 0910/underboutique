class AlterImagesCollections < ActiveRecord::Migration
  def change
  	rename_column :images, :collections_id, :collection_id
  end
end
