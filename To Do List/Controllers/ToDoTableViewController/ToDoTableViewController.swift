//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by  Apple24 on 07/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
// ToDoTableViewController+UITableViewDataSource

import UIKit

class ToDoTableViewController: UITableViewController {
    
    // MARK: - ... Stored Propertis
    var todos = [ToDo]()   // связь ViewController с моделью
    
     // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // подгружаем данные с внутреннего и с веншнего
        todos = ToDo.loadToDos()
        
        // отобразить кнопку Изменить на панели навигации
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
     // MARK: - ... Navigation
    // переход
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   <#code#>
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    // возврат на первый экран по segue
        guard segue.identifier == "SaveSegue" else { return }
        
        
        
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


