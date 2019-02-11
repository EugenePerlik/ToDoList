//
//  ToDoRealm.swift
//  Realm To Do List
//
//  Created by  Apple24 on 09/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//
// 11.02.2019 Realm promo

import Realm
import RealmSwift
import Foundation

class ToDo: Object {
    @objc dynamic var title = ""             // заголовок
    @objc dynamic var isComplete = false     // завершено или нет
    @objc dynamic var dueDate = Date()       // дата
    @objc dynamic var notes: String? = nil   // заметки
    
    // Получить область по умолчанию
    static let realm = try! Realm()
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
        super.init()
    }
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
     //   fatalError("init(value:schema:) has not been implemented")
    }
    
    // загружать из внешнего
    static func loadToDos() -> [ToDo]? {
        var todos = [ToDo]()
        let todoObjects = realm.objects(ToDo.self)
        //print(#function, todoObjects.count)
        for todo in todoObjects {
            todos.append(todo)
        }
        return todos
    }
    // загружать из внутреннего
    static func defaultToDos() -> [ToDo] {
        return []
    }
    // вид datePicker
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = " cccccc. dd LLL/yy  HH:mm "
        formatter.locale = Locale(identifier: "ru_RU") // русифецируем
        return formatter
    }()
}



