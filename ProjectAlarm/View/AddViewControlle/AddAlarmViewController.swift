//
//  AddAlarmViewController.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 21.01.2023.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var alarmDate: DateComponents?
    var addAlarmCompletion: ((DateComponents) -> ())?
    private let userDefaults = UserDefaults.standard
    private let viewModel: AddAlarmViewModelProtocol? = AddAlarmViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmDate = viewModel?.dateToDateComponents(date: datePicker.date)
    }
    
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        guard let alarmDateComponents = alarmDate else { return }
        
        addAlarmCompletion?(alarmDateComponents)
        self.dismiss(animated: true)
    }
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        alarmDate = viewModel?.dateToDateComponents(date: sender.date)
    }

}
