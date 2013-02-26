class Example < ActiveRecord::Base
  attr_accessible :name, :status, :age
  def make_name_capitalized
    self.name.capitalize
  end
end
