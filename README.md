# Ruby To-Do List Application

This is a simple To-Do List application built using Ruby and Tk. The application provides a graphical user interface (GUI) to manage tasks, allowing you to add and delete tasks. Tasks are saved to and loaded from a JSON file.

## Features

- **Add Tasks:** Enter a task in the input field and click the "Add Task" button to add it to the list.
- **Delete Tasks:** Select a task from the list and click the "Delete Task" button to remove it.
- **Persistent Storage:** Tasks are saved to `tasks.json` and loaded on startup, so they persist between sessions.

## Requirements

- Ruby (version 2.7 or higher recommended)
- Tk (usually included with Ruby installations)

## Installation

1. **Install Ruby:** Ensure Ruby is installed on your system. You can download it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

2. **Run the Application:**
   - Save the provided Ruby script to a file, e.g., `todo_list.rb`.
   - Open a terminal and navigate to the directory containing `todo_list.rb`.
   - Run the application with the command:
     ```bash
     ruby todo_list.rb
     ```

## Code Overview

- **`ToDoListUI` class:** Manages the GUI and task operations.
  - `initialize`: Sets up the GUI components and loads existing tasks.
  - `add_task`: Adds a new task to the list with a timestamp.
  - `delete_task`: Removes the selected task from the list.
  - `save_tasks`: Saves the tasks to `tasks.json`.
  - `load_tasks`: Loads tasks from `tasks.json` if it exists.

## Contributing

Feel free to open issues or submit pull requests to contribute to this project. 

## License

This project is licensed under the MIT License.

## Acknowledgements

- Tk for Ruby is used for the GUI components.
