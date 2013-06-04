class CreateBlogAndProducts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :body
      t.datetime :published_at
      t.text :layout
      t.text :video_url
      Post.category_fieldnames.each do |fieldname|
        t.boolean fieldname, null: false, default: false
      end
      t.timestamps
    end
    
    create_table :products do |t|
      t.text :name
      t.text :description
      t.boolean :available, null: false, default: true
      t.decimal :price, null: false
      t.timestamps
    end
    
    create_table :orders do |t|
      t.text :name
      t.text :email
      t.text :country
      t.text :province
      t.text :city
      t.text :postal_code
      t.text :address
      t.decimal :amount
      t.datetime :paid_on
      t.datetime :shipped_on
      t.datetime :canceled_on
      t.timestamps
    end
    
    create_table :order_products do |t|
      t.references :order
      t.references :product
      t.integer :quantity
    end

    create_table :images do |t|
      t.references :post
      t.references :product
      t.attachment :file
      t.timestamps
    end
  end
end
