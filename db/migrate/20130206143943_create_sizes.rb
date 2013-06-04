class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :label
      t.integer :order
    end

    create_table :product_sizes do |t|
      t.references :size
      t.references :product
    end
  end
end
