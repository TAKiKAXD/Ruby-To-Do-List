require 'tk'
require 'time'  
require 'json'  

class ToDoListUI
  TASK_FILE = 'tasks.json'  

  def initialize
    @tasks = []

    # Create the root window
    root = TkRoot.new { title "To-Do List" }

    main_frame = TkFrame.new(root).pack(padx: 10, pady: 10)

    TkLabel.new(main_frame) {
      text 'Simple To-Do List'
      font 'Arial 14 bold'
      pack { padx 15; pady 5; side 'top' }
    }

    @task_input = TkEntry.new(main_frame) {
      width 40  
      pack { padx 15; pady 10; side 'top' }
    }

    add_button = TkButton.new(main_frame) {
      text "Add Task"
      width 20
      pack { padx 15; pady 5; side 'top' }
    }
    add_button.command(proc { add_task })

    @task_listbox = TkListbox.new(main_frame) {
      width 50  
      height 10  
      pack { padx 15; pady 10; side 'top' }
    }

    delete_button = TkButton.new(main_frame) {
      text "Delete Task"
      width 20
      pack { padx 15; pady 5; side 'top' }
    }
    delete_button.command(proc { delete_task })

    load_tasks  

    Tk.mainloop 
  end

  def add_task
    task = @task_input.get
    if task.strip != ""
      timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")  
      task_with_timestamp = "#{task} (Created: #{timestamp})"  

      @tasks << task_with_timestamp
      @task_listbox.insert('end', task_with_timestamp)  
      @task_input.delete(0, 'end')  
      save_tasks 
    end
  end

  def delete_task
    selected_index = @task_listbox.curselection
    unless selected_index.empty?
      index = selected_index.first
      @task_listbox.delete(index)
      @tasks.delete_at(index)
      save_tasks  
    end
  end

  def save_tasks
    File.open(TASK_FILE, 'w') do |file|
      file.write(JSON.pretty_generate(@tasks))
    end
  end

  def load_tasks
    if File.exist?(TASK_FILE)
      file_content = File.read(TASK_FILE)
      @tasks = JSON.parse(file_content)
      @tasks.each do |task|
        @task_listbox.insert('end', task)
      end
    end
  end
end

ToDoListUI.new
