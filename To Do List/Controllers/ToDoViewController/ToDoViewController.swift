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
    
    // MARK: - ... Navigation
    // переход
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  на первый экран по segue Save
        super.prepare(for: segue, sender: sender) // вызов радителя
        guard segue.identifier == "SaveSegue" else { return }
        let title = titleTextField.text ?? ""
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        todo = ToDo(title:title, isComplete: isComplete, dueDate: dueDate, notes: notes) 
    }
    
    // MARK: - ... @IBAction
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
        // скрываем клавиатуру
        view.endEditing(true)
    }
    
    @IBAction func isCompleteButtonPressed(_ sender: UIButton) {
        // иконку на противоположную
        isCompleteButton.isSelected.toggle()
        isPickerHidden = true
        // скрываем клавиатуру
        view.endEditing(true)
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
}
