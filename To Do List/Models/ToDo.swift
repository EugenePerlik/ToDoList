//
//  ToDo.swift
//  To Do List
//
//  Created by  Apple24 on 07/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String    // заголовок
    var isComplete: Bool // завершено  или нет
    var dueDate: Date    // дата
    var note: String?    // заметки
    
    // вид datePicker
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = " dd LLL yy cccccc  HH:mm "
        formatter.locale = Locale(identifier: "ru_RU") // русифецируем
        return formatter
    }()

    // загружать из внешнего
    static func loadToDos() -> [ToDo] {
        return defaultToDos()
        
      //  loadSampleToDos
    }
    

    // загружать из внутреннего
    static func defaultToDos() -> [ToDo] {
        return [
            ToDo(title: "1 Дело ", isComplete: false, dueDate: Date(), note: "Заметка 1"),
            ToDo(title: "2 Дело ", isComplete: false, dueDate: Date(), note: "Заметка 2"),
            ToDo(title: "3 Дело ", isComplete: false, dueDate: Date(), note: "Заметка 3"),
            ToDo(title: "4 Дело ", isComplete: false, dueDate: Date(), note: "Заметка 4")
        ]
    }
}
