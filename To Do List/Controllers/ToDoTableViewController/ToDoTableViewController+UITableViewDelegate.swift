//
//  ToDoTableViewController+UITableViewDelegate.swift
//  To Do List
//
//  Created by  Apple24 on 08/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import UIKit
// методы редактирования

extension ToDoTableViewController {
    
    // MARK: - ... Table view Delegate
    
    // Переопределение для поддержки редактирования представления таблицы.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            todos.remove(at: indexPath.row) // Удалить строку из источника данных
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        case .insert: // Создайте новый экземпляр соответствующего класса, вставьте его в массив и добавьте новую строку
            break
        case .none:
            break
        }
    }
    
    
    

    
    
    
}

