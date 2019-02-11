//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by  Apple24 on 07/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
// ToDoTableViewController+UITableViewDataSource

import UIKit
import RealmSwift
import Realm

class ToDoTableViewController: UITableViewController {
    
    // MARK: - ... Stored Propertis
    var todos = [ToDo]() { // связь ViewController с моделью
        didSet {
            // Сохранение данных в Realm
            try! ToDo.realm.write {
                ToDo.realm.add(todos)
            }
        }
    }
    // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // подгружаем данные с веншнего Realm
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else { // нет данных
            todos = ToDo.defaultToDos()
        }
        // отобразить кнопку Изменить на панели навигации
        navigationItem.leftBarButtonItem = editButtonItem
    }
    // MARK: - Navigation
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // пришли  на первый экран по segue Save
        guard segue.identifier == "SaveSegue" else { return }
        //       ToDoViewController         источник
        guard let toDoViewController = segue.source as? ToDoViewController else { return }
        // проверяем пришли данные todo
        guard let todo = toDoViewController.todo else { return }
        
        let indexPath = IndexPath(row: todos.count, section: 0)
        // добавляем одну ячейку и обновляем  todo
        todos.append(todo)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}


