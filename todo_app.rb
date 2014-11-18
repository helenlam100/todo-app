class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
    @projects = []
    @tasks = []
  end

  def real_puts(message="")
    $stdout.puts message
  end

  def run

    running =  true

    while running

      welcome_main_menu

      user_input = gets.chomp

      if user_input == 'create'
        create_project

      elsif user_input == 'rename'
        rename_project

      elsif user_input == 'delete'
        delete_project

      elsif user_input == 'list'
        list_project

      elsif user_input == 'edit'
        puts "Which project would you like to add a task to?"
          task_menu = true
          while task_menu               #entering second loop for tasks

          user_input = gets.chomp

            puts "Editing Project: " + user_input
            puts "'list' to list tasks"
            puts "'complete' to complete a task and remove it from the list"
            puts "'create' to create a new task"
            puts "'edit' to edit a task"

            if user_input == 'list'
                if @tasks == []
                  puts "  none"
                else
                  @tasks.each do |tasks|
                    puts @tasks.join("\n")
                   end
                 end

            elsif user_input == 'complete'
              puts "Please enter the task name you have completed:\n"
              user_input = gets.chomp
              if @tasks.include?(user_input)
                @tasks.delete(user_input)    #delete the project name
                puts "do the " + user_input + ": completed"
              else
                puts "task not found: 'not here'"
              end

      # it "should report that it couldn't find the task" do
      #   app.run
      #   expect(output).to include("task not found: 'not here'")

            elsif user_input == 'create'
              puts "What would you like to name your task?"
              user_input = gets.chomp
              @tasks << user_input

            elsif user_input == 'edit'
              puts "Please enter the task name to edit:\n"
              user_input = gets.chomp
                if @tasks.include?(user_input)
                  @tasks.delete(user_input)
                  puts "Please enter the new task:\n"
                  user_input = gets.chomp
                  @tasks << user_input
                else
                  puts "task not found: 'not here'"
                end

            elsif user_input == 'back'  #back to main menu and out of task menu
              task_menu = false

            elsif user_input == 'quit'   #quit out of everything
              task_menu = false
              running = false
            end
          end

        elsif user_input == 'quit'       #use elsif and not else, because else would mean only either of the options provided.
        running = false
      end
    end
  end

#methods we created to call on for our projects

  def welcome_main_menu
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'quit' to quit project"
    puts "'rename' to rename a project"
    puts "'edit' to add a task to a project"
    puts "'delete' to delete a project"
  end

  def create_project
    puts "Please enter the new project name:\n"
    user_input = gets.chomp
    @projects << user_input
    #create a new class Project based on the user_input, then added to the projects array. @projects is going to change to a hash.
  end

  def rename_project
    puts "Please enter the project name to rename:\n"
    user_input = gets.chomp
    @projects.delete(user_input)    #retrieve the project name and remove it using .delete
    puts "Please enter the new project name:\n"
    user_input = gets.chomp
    @projects << user_input
    puts "Projects:\n  " + user_input
  end

  def delete_project
    puts "Please enter the project name to delete:\n"
    user_input = gets.chomp
    @projects.delete(user_input)    #delete the project name
    puts "Projects:\n  " + @projects.join("\n")
  end

  def list_project
    if @projects == []            #this is an if/else statement within the elsif, don't get confused.
      puts "Projects:\n  none"    #how to get this to not print if person has created a project
    else
      puts "Projects:\n  " + @projects.join("\n")
      end
    end
end

# class Project
#   attr_accessor :name, :tasks
#
#   def initialize(name)
#     @name = name
#     @tasks = []   #as we're creating our tasks we have the project
#   end
# end


#create a hash to access elements within the array, and add key value pairs and update the info as needed.


#Note: You can also use this while loop for the run method.
#def run
  #while true
    #user_input = gets
    #if user_input = 'stuff'
     #do stuff
    # elsif user_input == 'quit'
#   break
# end
