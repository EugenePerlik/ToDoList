//
//  ToDoViewController.swift
//  To Do List
//
//  Created by  Apple24 on 08/02/2019.
//  Copyright © 2019  Apple24. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
   
    // MARK: - ... @IBOutlet
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: - ... Stored Properties
    var todo: ToDo?
    
    var isPickerHidden = true {
        didSet {
            if oldValue != isPickerHidden {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
    }
    
    // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDatePicker.locale = Locale(identifier: "ru_RU")
        dueDatePicker.date = Date().addingTimeInterval(24 * 60 * 60)
        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
    }
    
    // MARK: - ... Custom Methods
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    // количество символов ненулевое
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        // скрываем SAVE
        saveButton.isEnabled = !text.isEmpty
    }

    
    
    // MARK: - ... @IBAction
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    @IBAction func isCompleteButtonPressed(_ sender: UIButton) {
        // иконку на противоположную
        isCompleteButton.isSelected.toggle()
        isPickerHidden = true
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
        isPickerHidden = true
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func textEditingFinished(_ sender: UIDatePicker) {
        isPickerHidden = true
    
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
