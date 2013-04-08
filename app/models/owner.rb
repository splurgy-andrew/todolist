class Owner < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :tasks, :dependent => :destroy
end
