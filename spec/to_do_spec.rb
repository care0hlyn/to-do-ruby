require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'is initialized with a description' do
    newTask = Task.new('walk the dog')
    newTask.should be_an_instance_of Task
  end

  it 'lets you read the description out'  do
    newTask = Task.new('walk the dog')
    newTask.name.should eq 'walk the dog'
  end

  it 'adds task to the list' do
    new_list = List.new('school')
    new_task = Task.new('walk the dog')
    new_list.add_task(new_task)
    new_list.tasks.should eq [new_task]
  end

  it 'removes the complete task' do
    new_list = List.new('school')
    new_task = Task.new('walk the dog')
    new_list.add_task(new_task)
    new_list.remove_task(new_task)
    new_list.tasks.should eq []
  end

  # it 'will save the list to a master list' do
  #   new_list = List.new('school')
  #   new_list.save
  #   new_list2 = List.new('home')
  #   new_list2.save
  #   List.all.should eq [new_list, new_list2]
  # end

end

