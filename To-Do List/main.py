'''
----------------------------TO-DO LIST--------------------------------------


Author - Tanishqua
Date - 7 Feb 2025
Desc - I haev implemented CRUD frunctionality in this project using PyMongo
driver to communicate with my MongoDB server.

PS - It was a fun way to begin my databasing journey. haha.

----------------------------------------------------------------------------
'''

from pymongo import MongoClient

uri = "mongodb+srv://tanishquabansal:Simform123@cluster0.hx00a.mongodb.net/"
client = MongoClient(uri)

db = client.todo_db
tasks_collection = db.tasks

# Insert function
def create_task(description):
    docs = tasks_collection.find()
    index = 1
    for i in docs:
        index = i['index'] + 1 # Gives the last used index and increments it.
    task = {
        'index': index,
        'task':description
    }
    result = tasks_collection.insert_one(task)
    print(f'Task created successfully')

# Read function
def read_tasks():
    tasks = tasks_collection.find()
    for docs in tasks:
        print(f"Task No.{docs['index']} - {docs['task']}")

# Update Function
def update_task(index, description):
    result = tasks_collection.update_one(
        {'index': index},
        {'$set': {'task':description}},
        True
        )
    print(f"Task {index} updated successfully")

# Delete Function
def delete_task(index):
    tasks_collection.delete_one({'index':index})
    print(f"Task {index} deleted successfully")

# App functioning
while True:
    print("\n1. Create Task")
    print("2. View Tasks")
    print("3. Update Task")
    print("4. Delete Task")
    print("5. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        print()
        description = input("Enter your task - ")
        create_task(description)
    elif choice == '2':
        print()
        read_tasks()
    elif choice == '3':
        print()
        ind = int(input("Enter Task Number - "))
        description = input("Enter your modified task - ")
        update_task(ind, description)
    elif choice == '4':
        print()
        ind = int(input("Enter Task Number - "))
        delete_task(ind)
    elif choice == '5':
        break
    else:
        print()
        print("Provide a valid option")