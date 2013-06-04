require 'helpers'

ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :published_at
    column :published_in, sortable: false
    column :layout
    default_actions
  end
  
  show do |post|
    attributes_table_with_images do
      row :title
      row :body
      row :published_in
      row :published_at
      row :layout
    end
  end

  form_with_images do |f|
    f.input :title, as: :string
    f.input :layout, as: :select, collection: Post.available_layouts, include_blank: false
    f.input :video_url, as: :string
    f.input :published_at, as: :datepicker
    Post.category_fieldnames.each do |field|
      f.input field, label: "Publish on #{ Post.category_labels[field] }"
    end
    f.input :body
  end
end
