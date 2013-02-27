class Task < ActiveRecord::Base
  attr_accessible :completed, :position, :title
end
