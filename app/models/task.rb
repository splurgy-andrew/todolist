class Task < ActiveRecord::Base
  attr_accessible :completed, :position, :title, :due_date, :category
  validates :title, :presence => true, :length => {:maximum => 25}
  validates :due_date, :presence => true

  def category
    return "personal"
  end

  def overdue?
    if self.due_date < Date.today
      return true
    else
      return false
    end
  end
end
