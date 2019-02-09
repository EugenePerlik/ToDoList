//
//  ToDoRealm.swift
//  Realm To Do List
//
//  Created by  Apple24 on 09/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import RealmSwift

class ToDoList: Object {
    @objc dynamic var title = ""          // заголовок
    @objc dynamic var isComplete = false  // завершено  или нет
    @objc dynamic var dueDate = Date()    // дата
    @objc dynamic var note = ""          // заметки
    
    // Получить область по умолчанию
    static let realm = try! Realm()
    
    required init() {
        super.init()
    }
    

    
    

    

}



