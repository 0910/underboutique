class Size < ActiveRecord::Base
  attr_accessible :label, :order, as: [:admin, :default]

  def to_label
    label
  end
end