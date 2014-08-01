class List
  @@lists = []

  def initialize(name)
    @name = name
    @tasks = []
  end

  def name
    @name
  end

  def tasks
    @tasks
  end

  def List.all
    @@lists
  end

  def save
    @@lists << self
  end

  def remove(input)
    @@lists.delete_at(input)
  end

  def add_task(task)
    @tasks << task
  end

  def remove_task(task)
    @tasks.delete(task)
  end
end
