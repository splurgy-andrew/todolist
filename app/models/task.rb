class Task < ActiveRecord::Base
  attr_accessible :completed, :position, :title, :due_date, :category
  validates :title, :presence => true, :length => {:maximum => 25}
  validates :due_date, :presence => true
  validates :category, :inclusion => {:in => %w(personal work),
                                      :message => "%(value) is not a valid category"}

  after_initialize :default_value

  def overdue?
    if self.due_date < Date.today
      return true
    else
      return false
    end
  end

  private
    def default_value
      self.category= "personal" if category.nil?
    end
end