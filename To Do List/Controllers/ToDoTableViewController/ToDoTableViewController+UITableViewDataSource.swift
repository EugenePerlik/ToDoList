//
//  ToDoTableViewController+UITableViewDataSource.swift
//  To Do List
//
//  Created by  Apple24 on 08/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import UIKit

extension ToDoTableViewController {
    
    
    // MARK: - Table view data source Источник данных
    //Возвращает количество секций в табличном представлении.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Количество строк в section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    // созданный объект ячейки, используеться для указанной строки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") else {
            // проверяем на создание ячейки
            print(" == Ошибка в \(#file.name) в \(#function) на строке \(#line): переход ToDoCell ")
            fatalError()
        }
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = "\(ToDo.dueDateFormatter.string(from: todo.dueDate))"
        // отображать завершенные дела
        cell.accessoryType = todo.isComplete ? .checkmark : .none
        
        
        return cell
    }
    
    // для условного редактирования представления таблицы.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Возвращает false, если не требуется, чтобы указанный элемент !!! был доступен для редактирования. (удалять)
        return true
    }
}

