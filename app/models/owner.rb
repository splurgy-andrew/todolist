class Owner < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, :email, :presence => true

  has_many :tasks, :dependent => :destroy
end
