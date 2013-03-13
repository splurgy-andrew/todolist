class Task < ActiveRecord::Base
  attr_accessible :completed, :position, :title, :due_date
  validates :title, :presence => true, :length => {:maximum => 25}
  validates :due_date, :presence => true

  def overdue?
    if self.due_date < Date.today
      return true
    else
      return false
    end
  end
end
