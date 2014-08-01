require './lib/list'
require './lib/task'

@current_list = 0

def main_menu
  loop  do
    puts "Press '1' to create a list."
    puts "Press '2' to modify list(s)."
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
  puts "Press '0' to exit."
  name = gets.chomp
  if name == 0
    main_menu
  end
  new_list = List.new(name)
  puts "New list added.\n"
  new_list.save
  List.all.each_with_index do |list, index|
  puts "#{index+1}. #{list.name}"
  end
end

def list_lists
  List.all.each_with_index do |list, index|
  puts "#{index+1}. #{list.name}"
  end
  puts "\n\nPress index of list to modify or '0' to main menu.\n\n"
  @current_list = gets.chomp.to_i

  if @current_list == 0
    puts "Goodbye"
    main_menu
  else
    puts "\n\nPress '1' to delete this list."
    puts "Press '2' to add a task to this list."
    modify_choice = gets.chomp

    if modify_choice == "1"
      List.all.delete_at(@current_list-1)
      puts "List deleted\n\n"
      list_lists
    elsif modify_choice == "2"
      create_task
    end
  end
end

def create_task
  List.all[@current_list-1].tasks.each_with_index do |task, index|
  puts "#{index+1}. #{task.name}"
  end
  puts "\n\nPress '1' to enter task name."
  puts "Press '2' to go to main menu."
  puts "Press '3' to go back to lists.\n\n"

  name = gets.chomp

  if name == "2"
    puts "Goodbye"
    main_menu
  elsif name == "3"
    list_lists
  elsif name == "1"
    puts "Task name?"
    new_task = Task.new(gets.chomp)
    List.all[@current_list-1].tasks.push(new_task)
    puts "\nTask added.\n\n"

    create_task
  end
end

main_menu
