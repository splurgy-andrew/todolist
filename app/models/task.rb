class Task < ActiveRecord::Base
  attr_accessible :completed, :position, :title
  validates :title, :presence => true, :length => {:maximum => 25}
end
