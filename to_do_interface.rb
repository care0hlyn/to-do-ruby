require './lib/list'
require './lib/task'

@current_list = 0

def main_menu
  loop  do
    puts "Press '1' to create a list."
    puts "Press '2' to list all list(s)."
    puts "Press 'x' to exit."

    main_choice = gets.chomp

    if main_choice == '1'
      create_list
    elsif main_choice == '2'
      list_lists
    elsif main_choice == 'x'
      puts "Good-bye"
      exit
    else
      puts "Invalid."
    end
  end
end

def create_list
  puts "List name?"
  name = gets.chomp
  new_list = List.new(name)
  puts "New list added.\n"
  new_list.save
  List.all.each_with_index do |list, index|
  puts "#{index+1}. #{list.name}"
  end
end

def list_lists
  puts "Press index of list to modify or '0' to exit"
  @current_list = gets.chomp.to_i

  if @current_list == 0
    puts "Goodbye"
    main_menu
  else
    puts "Press '1' to delete this list."
    puts "Press '2' to add task."
    modify_choice = gets.chomp.to_i

    if modify_choice == 1
      List.all.delete_at(@current_list-1)
    elsif modify_choice == 2
      create_task
    end
  end
end

def create_task
  puts "Enter name of new task."
  puts "Press '0' to go to main menu."
  puts "Press '1' to go back to lists."
  name = gets.chomp
  if name == 0
    puts "Goodbye"
    main_menu
  elsif name == 1
    list_lists
  end

  new_task = Task.new(name)
  puts "Task added.\n\n"
  # List.all[current_list-1].tasks.push(new_task)
  List.all[@current_list-1].tasks.push(new_task)
  puts List.all[@current_list-1].tasks
  create_task
end

main_menu
