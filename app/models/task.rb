class Task < ActiveRecord::Base
  attr_accessible :completed, :position, :title, :due_date, :category
  validates :title, :presence => true, :length => {:maximum => 25}
  validates :due_date, :presence => true
  validate :due_date_in_the_future
  validates :category, :inclusion => {:in => %w(personal work),
                                      :message => "%(value) is not a valid category"}

  after_initialize :default_value

  def due_date_in_the_future
    if not self.completed? and not self.due_date.blank?
      if (self.due_date <=> Date.today) <= 0
        errors.add(:due_date, "due_date must be in the future")
      end
    end
  end

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