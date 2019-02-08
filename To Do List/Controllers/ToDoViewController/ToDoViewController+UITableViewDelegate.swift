//
//  ToDoViewController+UITableViewDelegate.swift
//  To Do List
//
//  Created by  Apple24 on 08/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import UIKit

extension ToDoViewController {
    // указывает высоту ячейки для Picker Date
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalHeight = CGFloat(44)
        let largeHeight = CGFloat(200)
        
        switch indexPath {
        case IndexPath(row: 0, section: 1):
            return isPickerHidden ? normalHeight : 0
        case IndexPath(row: 1, section: 1):
            return isPickerHidden ? 0 : largeHeight
        default:
            return normalHeight
        }
    }
    
    // Объект представления таблицы, информирующий делегата о новом выборе строки.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case IndexPath(row: 0, section: 1):
            isPickerHidden = false
        default:
            isPickerHidden = true
        }
        // обновить таблицу
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
