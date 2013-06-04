class PopulateSizes < ActiveRecord::Migration
  def up
    %w(Extra-Small Small Medium Large Extra-Large).each_with_index do |name, index|
      Size.create! label: name, order: index
    end
    (36..45).each do |name|
      Size.create! label: name.to_s, order: name
    end
  end

  def down
    ProductSize.destroy_all
    Size.destroy_all
  end
end
