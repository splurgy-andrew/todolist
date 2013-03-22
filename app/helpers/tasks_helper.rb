module TasksHelper
  def task_class(task)
    if task.completed? and task.overdue?
      return "completed"
    elsif task.completed?
      return "completed"
    elsif task.overdue?
       return "overdue"
    end
  end
end
