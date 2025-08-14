#!/bin/bash
FILE="todo.txt"
touch "$FILE"

while true; do
    echo "===== Terminal To-Do List ====="
    echo "1) View tasks"
    echo "2) Add task"
    echo "3) Mark task as done"
    echo "4) Delete task"
    echo "5) Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) nl -w2 -s". " "$FILE" ;;
        2) read -p "Enter task: " task; echo "[ ] $task" >> "$FILE"; echo "Task added!" ;;
        3) nl -w2 -s". " "$FILE"
           read -p "Enter task number to mark done: " num
           sed -i "${num}s/\\[ \\]/[x]/" "$FILE"
           echo "Task marked as done!" ;;
        4) nl -w2 -s". " "$FILE"
           read -p "Enter task number to delete: " num
           sed -i "${num}d" "$FILE"
           echo "Task deleted!" ;;
        5) exit 0 ;;
        *) echo "Invalid choice" ;;
    esac
    echo
done
