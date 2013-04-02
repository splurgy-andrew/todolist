module TasksHelper
  def completed_task(task)
    if task.completed?
      return "completed"
    end
  end

  def overdue_task(task)
    if task.overdue?
      if not task.completed?
        return "overdue"
      end
    end
  end

end
