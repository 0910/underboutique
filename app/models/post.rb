class Post < ActiveRecord::Base
  has_many :images

  # Categories are saved as a flat collection of fields in the post model for speed
  # and simplicity.
  # Each post has one boolean field representing that the post should be shown in a given
  # category.
  # If you need to add a category you'll need to achieve the following steps:
  #   1. Add it here.
  #   2. Add a migration which adds the field.
  #   3. That's it, routes and everything else should be created automatically.
  def self.categories
    { bikes: [:featured, :watch_this], travel: [:remote] }
  end

  # The simbolized fieldnames for each category.
  def self.category_fieldnames
    categories.collect do |blog, children|
      children.collect{|child| "on_#{blog}_#{child}".to_sym }
    end.flatten
  end
  
  def self.available_layouts
    %w(photos video)
  end

  attr_accessible :title, :body, :layout, :video_url,
    :published_at, :images_attributes, *self.category_fieldnames, as: [:admin, :default]
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :layout,
    inclusion: { in: self.available_layouts, message: 'Must be either video or photos'}
  validates :title, presence: true

  def self.category_labels
    {}.tap do |labels|
      categories.each do |blog, children|
        children.each do |child|
          labels["on_#{blog}_#{child}".to_sym] = "#{blog}/#{child.to_s.gsub('_',' ')}"
        end
      end
    end
  end
  
  # Categories are grouped into blogs, so this rounds up all categories on a given
  # blog and returns all posts in those categories.
  def self.find_by_blog(blog_name)
    fields = categories[blog_name.to_sym].collect{|category| "on_#{blog_name}_#{category}"}
    self.where(fields.join(" OR "))
  end
  
  # This is a string displaying all the categories the post was published in
  def published_in
    Post.category_fieldnames.collect do |category|
      Post.category_labels[category] if self.send(category)
    end.compact.join(', ')
  end
end
