//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by  Apple24 on 07/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
// ToDoTableViewController+UITableViewDataSource

import UIKit
import RealmSwift

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
    
    
    
   // var todos = [ToDo]()
    
     // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // подгружаем данные с внутреннего и с веншнего
     //   todos = ToDo.loadToDos()
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            print("=========== нет данных ========")
            todos = ToDo.defaultToDos()
        }
        
        
        // отобразить кнопку Изменить на панели навигации
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    
    
    
    // MARK: - Navigation
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(#function, segue.identifier!, "====+++++")
        //  на второй экран по segue Save
        
        super.prepare(for: segue, sender: sender) // вызов радителя
        guard segue.identifier == "EditToDoCell" else { return }

   //     var destinationToDoViewController = segue.destination as! ToDoViewController
        
       // destinationToDoViewController = 
        
        
        
        // print(todos)
        
    
       
//        let isComplete = isCompleteButton.isSelected
//        let dueDate = dueDatePicker.date
//        let notes = notesTextView.text
//        todo = ToDo(title:title, isComplete: isComplete, dueDate: dueDate, notes: notes)
//ToDo
       
  //     print("==",title, "==" )
  //      let todo = todos[indexPath.row]
  //      cell.textLabel?.text = todo.title
    }

    
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













    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
}


